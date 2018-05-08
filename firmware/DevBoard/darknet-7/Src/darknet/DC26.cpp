/*
 * DC26.cpp
 *
 *  Created on: Dec 3, 2017
 *      Author: dcomes
 */

#include "DC26.h"
#include "libstm32/display/display_device.h"
#include "libstm32/display/gui.h"
#include "libstm32/display/fonts.h"
#include <main.h>
#include "libstm32/config.h"
#include <usart.h>
#include <spi.h>
#include <i2c.h>

using cmdc0de::ErrorType;
using cmdc0de::DisplayST7735;
using cmdc0de::DrawBufferNoBuffer;
using cmdc0de::GUIListData;
using cmdc0de::GUIListItemData;
using cmdc0de::GUI;

static const uint32_t DISPLAY_WIDTH = 128;
static const uint32_t DISPLAY_HEIGHT = 160;
static const uint32_t DISPLAY_OPT_WRITE_ROWS = 2;
DisplayST7735 Display(DISPLAY_WIDTH, DISPLAY_HEIGHT, DisplayST7735::PORTAIT);
uint16_t DrawBuffer[DISPLAY_WIDTH * DISPLAY_OPT_WRITE_ROWS]; //120 wide, 10 pixels high, 2 bytes per pixel (uint16_t)
uint8_t DrawBufferRangeChange[DISPLAY_HEIGHT / DISPLAY_OPT_WRITE_ROWS + 1];

cmdc0de::DrawBufferNoBuffer NoBuffer(&Display, &DrawBuffer[0],
		DISPLAY_OPT_WRITE_ROWS);

DC26::DC26() {
	// TODO Auto-generated constructor stub

}

DC26::~DC26() {
	// TODO Auto-generated destructor stub
}

ErrorType DC26::onInit() {
	ErrorType et;

	GUIListItemData items[4];
	GUIListData DrawList((const char *) "Self Check", items, uint8_t(0),
			uint8_t(0), uint8_t(128), uint8_t(64), uint8_t(0), uint8_t(0));
	//DO SELF CHECK
	if ((et = Display.init(DisplayST7735::FORMAT_16_BIT,
			DisplayST7735::ROW_COLUMN_ORDER, &Font_6x10, &NoBuffer)).ok()) {
		HAL_Delay(1000);
		items[0].set(0, "OLED_INIT");
		DrawList.ItemsCount++;
	}
	GUI gui(&Display);
	gui.drawList(&DrawList);
	Display.swap();

	return et;
}

static const char *RFAILED = "Receive Failed";
static const char *TFAILED = "Transmit Failed";
static const char *DFAILED = "Device no ready";
static const uint16_t ESP_ADDRESS = 1;

ErrorType DC26::onRun() {
	if (HAL_GPIO_ReadPin(MID_BUTTON1_GPIO_Port, MID_BUTTON1_Pin)
			== GPIO_PIN_RESET) {
		Display.fillScreen(cmdc0de::RGBColor::BLACK);
		char oBuf[129] = { '\0' };
		char iBuf[129] = { '\0' };
		strcpy(&oBuf[0], "1234567890");
		//uint8_t i = 0;
		//uint8_t o = 1;
		Display.drawString(0, 10, &iBuf[0], cmdc0de::RGBColor::WHITE);
		Display.drawString(0, 20, &oBuf[0], cmdc0de::RGBColor::WHITE);
#if 0
		HAL_GPIO_WritePin(ESP_CS_GPIO_Port, ESP_CS_Pin, GPIO_PIN_RESET);
		HAL_Delay(1);
		if (HAL_OK != HAL_SPI_TransmitReceive(&hspi3,(uint8_t *)&oBuf[0],(uint8_t *)&iBuf[0],12,1000)) {
			Display.drawString(0, 30, TFAILED, cmdc0de::RGBColor::WHITE);
		}
		HAL_GPIO_WritePin(ESP_CS_GPIO_Port, ESP_CS_Pin, GPIO_PIN_SET);
#endif
#if 1
		//HAL_UART_IRQHandler()
		if(HAL_OK!=HAL_UART_Transmit(&huart1,(uint8_t *)&oBuf[0],12,1000)) {
			Display.drawString(0,30,TFAILED, cmdc0de::RGBColor::WHITE);
		}
		HAL_Delay(5);
		//HAL_UART_GetState()
		if(HAL_OK!=HAL_UART_Receive(&huart1,(uint8_t *)&iBuf[0],12,1000)) {
			Display.drawString(0,30,RFAILED, cmdc0de::RGBColor::WHITE);
		}
#endif
#if 0
		if(HAL_OK==HAL_I2C_IsDeviceReady(&hi2c1,ESP_ADDRESS,10,1000)) {
		if(HAL_OK==HAL_I2C_Master_Transmit(&hi2c1,ESP_ADDRESS,(uint8_t *)&oBuf[0],11,1000)) {
			if(HAL_OK!=HAL_I2C_Master_Receive(&hi2c1,ESP_ADDRESS,(uint8_t*)&iBuf[0],129,1000)) {
				Display.drawString(0,30,RFAILED, cmdc0de::RGBColor::WHITE);
			}
		} else {
			Display.drawString(0,30,TFAILED, cmdc0de::RGBColor::WHITE);
		}
		} else {
			Display.drawString(0,30,DFAILED, cmdc0de::RGBColor::WHITE);
		}
#endif
		Display.drawString(0, 50, &oBuf[0], cmdc0de::RGBColor::WHITE);
		Display.drawString(0, 60, &iBuf[0], cmdc0de::RGBColor::WHITE);
		Display.swap();
		HAL_Delay(2000);
	}

	cmdc0de::StateBase *cs = getCurrentState();

	return ErrorType();
}