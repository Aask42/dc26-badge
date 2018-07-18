#ifndef DC26_BLUETOOTH
#define DC26_BLUETOOTH

#include "esp_system.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "../lib/Task.h"
#include "../lib/ble/BLEDevice.h"
#include "../mcu_to_mcu.h"
#include "pairing.h"
#include "scanning.h"
#include "security.h"

class BluetoothTask : public Task {
public:
	static const char *LOGTAG;

	BLEDevice *pDevice;
	BLEServer *pServer;
	BLEClient *pClient;
	BLEService *pService;
	BLEScan *pScan;
	BLEAddress *connectedDevice;
	BLESecurity *pSecurity;
	MySecurity *pMySecurity;
	BLEAdvertising *pAdvertising;
	MyScanCallbacks *pScanCallbacks;
	BLECharacteristic *pUartCisoCharacteristic;
	BLECharacteristic *pUartCosiCharacteristic;
	BLEAdvertisementData adv_data;

	// Advertisement data
	bool advertising_enabled = false;
	std::string adv_name = "DN1";
	std::string adv_manufacturer = "DNAAAAA"; //DN-devType-Infection-Cure

	// Security stuff -- FIXME: remove actingClient/Server
	bool isActingClient = false;
	bool isActingServer = false;

	// Callback message queue
	static const int CBACK_MSG_QUEUE_SIZE = 5;
	static const int CBACK_MSG_ITEM_SIZE = sizeof(void *); // TODO: Msg Size?
	StaticQueue_t CallbackQueue;
	QueueHandle_t CallbackQueueHandle = nullptr;
	uint8_t CallbackBuffer[CBACK_MSG_QUEUE_SIZE * CBACK_MSG_ITEM_SIZE];

	// STM to ESP Queue
	static const int STM_MSG_QUEUE_SIZE = 5;
	static const int STM_MSG_ITEM_SIZE = sizeof(MCUToMCUTask::Message *);
	StaticQueue_t STMQueue;
	QueueHandle_t STMQueueHandle = nullptr;
	uint8_t fromSTMBuffer[STM_MSG_QUEUE_SIZE*STM_MSG_ITEM_SIZE];
	QueueHandle_t getQueueHandle() {return STMQueueHandle;}

public: // API
	void isAdvertising(void);
	void startAdvertising(void);
	void stopAdvertising(void);
	void toggleAdvertising(const darknet7::STMToESPRequest* m);
	void setDeviceType(uint8_t devtype);
	void getDeviceName(void);
	void setDeviceName(const darknet7::STMToESPRequest* m);
	void getExposureData(void);
	void setExposureData(const darknet7::STMToESPRequest* m);
	void getInfectionData();
	void setInfectionData(const darknet7::STMToESPRequest* m);
	void getCureData();
	void setCureData(const darknet7::STMToESPRequest* m);
	void scanForDevices(const darknet7::STMToESPRequest* m);
	void pairWithDevice(const darknet7::STMToESPRequest* m);
	void sendPINConfirmation(const darknet7::STMToESPRequest* m);
	void getConnectedDevices();
	void sendDataToDevice(const darknet7::STMToESPRequest* m);
	void disconnect();

public:
	BluetoothTask(const std::string &tName, uint16_t stackSize=10000, uint8_t p=5);
	bool init();
	void commandHandler(MCUToMCUTask::Message* cmd);
	virtual void run(void *data);
	virtual ~BluetoothTask();
protected:
	void refreshAdvertisementData(void);
};


#endif // DC26_BLUETOOTH
