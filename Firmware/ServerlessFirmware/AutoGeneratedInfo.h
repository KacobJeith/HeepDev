#pragma once

#include <stdint.h>
// The heepByte is our standard 8bit unit that we will work with
typedef unsigned char heepByte;

#define DEVICE_USES_WIFI

#define STANDARD_ID_SIZE 4
#define STANDARD_ID_SIZE_BASE_64 8 // 4 * ceiling(STANDRD_ID_SIZE/3)

// Include the standard Heep Data Types
#include "CommonDataTypes.h"

// Device ID and MAC Address used for all Heep Communication
extern heepByte deviceIDByte [STANDARD_ID_SIZE];
extern uint8_t mac[6];

//#define USE_ANALYTICS
// #define POST_ANALYTICS
#ifdef USE_ANALYTICS
extern heepByte base64DeviceIDByte [STANDARD_ID_SIZE_BASE_64];
#endif

// Only one of these blocks is necessary. It will determine
// which physical system is being used
#ifdef ON_PC
#include "Socket_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#include "Simulation_Timer.h"
#endif

#ifdef ON_ESP8266
String SSID = "YOUR_SSID";
String Password = "YOUR_WIFI_PASSWORD";
#include <string.h>
#include "ESP8266_HEEPComms.h"
#include "ESP8266_NonVolatileMemory.h"
#include "Arduino_Timer.h"
#endif

#ifdef ON_ARDUINO
#include <string.h>
#include "ENC28j60_HeepComms.h"
#include "Arduino_EEPROM.h"
#include "Arduino_Timer.h"
#endif

#ifdef SIMULATION
#include <string.h>
#include "Simulation_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#include "Simulation_Timer.h"
#endif

#ifdef ON_PIC
#include "PICW5500_HeepComms.h"
#include "PICW5500_NonVolatileMemory.h"
#include "PICW5500_Timer.h"
#endif

#ifdef ON_POE32U4
#include "POE32u4W5500_HeepComms.h"
#include "Arduino_EEPROM.h"
#include "Arduino_Timer.h"
#endif
