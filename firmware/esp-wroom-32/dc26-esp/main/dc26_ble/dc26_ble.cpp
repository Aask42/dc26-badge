#include <stdio.h>
#include <string.h>
#include "dc26_ble.h"
#include "dc26_ble_pairing_server.h"
#include "dc26_ble_pairing_client.h"
#include "dc26_ble_scanning.h"
#include "../lib/ble/BLEDevice.h"


const char *BluetoothTask::LOGTAG = "BluetoothTask";

void BluetoothTask::startB2BAdvertising()
{
	if (!b2b_advertising_enabled)
	{
		ESP_LOGI(LOGTAG, "STARTING BT ADVERTISEMENT");
		pAdvertising->start();
		b2b_advertising_enabled = true;
	}
	else
	{
		ESP_LOGI(LOGTAG, "ADVERTISEMENT ALREADY RUNNING");
	}
}

void BluetoothTask::stopB2BAdvertising()
{
	if (b2b_advertising_enabled)
	{
		ESP_LOGI(LOGTAG, "STOPPING BT ADVERTISEMENT");
		pAdvertising->stop();
		b2b_advertising_enabled = false;
	}
	else
	{
		ESP_LOGI(LOGTAG, "ADVERTISEMENT ALREADY STOPPED");
	}
}


void BluetoothTask::scan(bool active)
{
	ESP_LOGI(LOGTAG, "STARTING SCAN");
	if (scan_started)
	{
		ESP_LOGI(LOGTAG, "SCAN ALREADY IN PROGRESS. ABORTED.");
		return;
	}
	scan_started = true;

	pScan->setActiveScan(active);
	//pScan->start(scan_time);
	pScan->start(10);

	if (pScanCallbacks->server_found)
	{
		server_found = pScanCallbacks->server_found;
		pServerAddress = pScanCallbacks->pServerAddress;
	}

	scan_started = false;
	ESP_LOGI(LOGTAG, "SCAN COMPLETE");
	return;
}

void BluetoothTask::pair()
{
	ESP_LOGI(LOGTAG, "STARTING PAIRING\n");

	// Connect to the remote BLE Server.
	pPairingClient->connect(*pServerAddress);
	printf("Connected to server\n");
}

void BluetoothTask::unpair()
{
	pPairingClient->disconnect();
}

void BluetoothTask::setB2BAdvData(std::string new_name, std::string new_man_data)
{
	// TODO: Check length < 10 characters
	ESP_LOGI(LOGTAG, "SETTING ADVERTISMENT DATA");
	adv_name = new_name;
	adv_manufacturer = "DN" + new_man_data;

	// Stop advertising, re-set data, return advertising to original state
	bool original_state = b2b_advertising_enabled;
	if (original_state)
	{
		stopB2BAdvertising();
	}

	// Setup data
	BLEAdvertisementData adv_data;
	adv_data.setAppearance(0x26DC);
	adv_data.setFlags(0x6);
	adv_data.setName(adv_name);
	adv_data.setManufacturerData(adv_manufacturer);
	//printf("ADV PAYLOAD: %s\n", adv_data.getPayload().c_str());

	pAdvertising->setAdvertisementData(adv_data);

	// Restart if we were already advertising
	if (original_state)
	{
		startB2BAdvertising();
	}
}

bool isClient = false;
void BluetoothTask::run(void * data)
{
	// TODO: Get commands from Queue
	ESP_LOGI(LOGTAG, "RUNNING");
	BTCmd cmd;
	if (isClient)
		cmd = BT_CMD_PASSIVE_SCAN;
	else
	{
		cmd = BT_CMD_UNK;
	}
	while (1)
	{
		vTaskDelay(5000 / portTICK_PERIOD_MS);
		// TODO: Check queue for command
		switch(cmd)
		{
			case BT_CMD_START_B2B:
				startB2BAdvertising();
				cmd = BT_CMD_SET_B2B_ADV_DATA;
				break;
			case BT_CMD_STOP_B2B:
				ESP_LOGI(LOGTAG, "");
				stopB2BAdvertising();
				cmd = BT_CMD_UNK;
				break;
			case BT_CMD_SET_B2B_ADV_DATA:
				setB2BAdvData("GOURRY!!!", "INFECT");
				cmd = BT_CMD_ACTIVE_SCAN;
				break;
			case BT_CMD_PASSIVE_SCAN:
				scan(false);
				if (server_found)
					cmd = BT_CMD_PAIR;
				break;
			case BT_CMD_ACTIVE_SCAN:
				scan(true);
				if (server_found)
					cmd = BT_CMD_PAIR;
				break;
			case BT_CMD_PAIR:
				pair();
				cmd = BT_CMD_UNK;
				break;
			default:
				ESP_LOGI(LOGTAG, "INFINITE LOOP");
				break;
		}
	}
}

BLEDevice Device;
BLEAdvertising Advertising;
UartWriteCharCallbacks UartWriteCallbacks;
UartServerCallbacks iUartServerCallbacks;
UartClientCallbacks iUartClientCallbacks;
MyScanCallbacks ScanCallbacks;

bool BluetoothTask::init()
{
	ESP_LOGI(LOGTAG, "INIT");
	//pDevice = new BLEDevice();
	pDevice = &Device;
	pDevice->init("DCDN BLE Device");


	if (!isClient)
	{
		// Create out Bluetooth Server
		pServer = pDevice->createServer();

		// Create the UART Service
		pService = pServer->createService(uartServiceUUID);
		// setup characteristic for the server to send info
		pUartReadCharacteristic = pService->createCharacteristic(
											uartReadUUID,
											BLECharacteristic::PROPERTY_NOTIFY);
		iUartServerCallbacks.pCharacteristic = pUartReadCharacteristic;
		pServer->setCallbacks(&iUartServerCallbacks);
		
		// setup characteristic for the client to send info
		pUartWriteCharacteristic = pService->createCharacteristic(
											uartWriteUUID,
											BLECharacteristic::PROPERTY_WRITE);
		pUartWriteCharacteristic->setCallbacks(&UartWriteCallbacks);
		pService->start();

		// Setup advertising object
		pAdvertising = pServer->getAdvertising();
		pAdvertising->addServiceUUID(uartServiceUUID);
		setB2BAdvData(adv_name, adv_manufacturer);
		startB2BAdvertising();
	}
	
	// setup pairing client
	pPairingClient = pDevice->createClient();
	pPairingClient->setClientCallbacks(&iUartClientCallbacks);

	// Setup scanning object and callbacks
	pScan = pDevice->getScan();
	//pScanCallbacks = new MyScanCallbacks();
	pScanCallbacks = &ScanCallbacks;
	pScan->setAdvertisedDeviceCallbacks(pScanCallbacks);

	return true;
}

BluetoothTask::BluetoothTask(const std::string &tName, uint16_t stackSize, uint8_t p)
	: Task(tName, stackSize, p), InQueue(), InQueueHandle(nullptr) {
	//TODO: , ESPToBTBuffer() {
	ESP_LOGI(LOGTAG, "CREATE\n");
}

BluetoothTask::~BluetoothTask() {
	// TODO
}
