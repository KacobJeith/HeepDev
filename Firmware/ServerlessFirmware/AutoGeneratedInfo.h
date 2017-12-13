#pragma once

// Overall Version of the Firmware. This is reported so that
// front Ends are able to translate or determine that they don't
// understand a certain device
#define FIRMWARE_VERSION 1

// Pin that will clear all memory on the device so that only core 
// memory remains
#define FACTORY_RESET_PIN 4

// Memory Allocation. These numbers are actually device specific, 
// but they require more research to nail down the exact numbers
// for each device
#define MAX_MEMORY 255			// Bytes
#define NUM_VERTICES 100		// Vertex Pointers
#define NUM_CONTROLS 100		// Control Pointers
#define OUTPUT_BUFFER_SIZE 200	// Bytes
#define INPUT_BUFFER_SIZE 200	// Bytes

// Heep OS Task Scheduling System
// Determine how frequently a task is run and how many tasks can be made
#define SYSTEM_TASK_INTERVAL 1000 // Time in ms
#define NUMBER_OF_TASKS 4

// Indexed IDs are a form of compression that can be used
// on memory limited devices. These are particularly useful
// When using IDs that are very long strings
//#define USE_INDEXED_IDS

#define STANDARD_ID_SIZE 4

#ifdef USE_INDEXED_IDS
#define ID_SIZE 1
#else 
#define ID_SIZE STANDARD_ID_SIZE
#endif

// Include the standard Heep Data Types
#include "CommonDataTypes.h"

// Only one of these blocks is necessary. It will determine
// which physical system is being used
#ifdef ON_PC
#include "Socket_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#include "Simulation_Timer.h"
#endif

#ifdef ON_ESP8266
#include <string.h>
#include "ESP8266_HEEPComms.h"
#include "Simulation_NonVolatileMemory.h"
#include "Arduino_Timer.h"
String SSID = "YOUR_SSID";
String Password = "YOUR_WIFI_PASSWORD";
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

// Device ID and MAC Address used for all Heep Communication
heepByte deviceIDByte [STANDARD_ID_SIZE] = {0x01, 0x02, 0x03, 0x04};
uint8_t mac[6] = {0x01,0x02,0x03,0x04,0x05,0x06};
