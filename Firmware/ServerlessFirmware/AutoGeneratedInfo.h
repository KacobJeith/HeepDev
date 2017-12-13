#pragma once

#define FIRMWARE_VERSION 1

#define FACTORY_RESET_PIN 4

#define MAX_MEMORY 255
#define NUM_VERTICES 100
#define NUM_CONTROLS 100
#define OUTPUT_BUFFER_SIZE 200
#define INPUT_BUFFER_SIZE 200

#define SYSTEM_TASK_INTERVAL 1000 // Time in ms
#define NUMBER_OF_TASKS 4

#ifndef ON_ARDUINO
#include <string.h>
#endif

//#define USE_INDEXED_IDS

#define STANDARD_ID_SIZE 4

#ifdef USE_INDEXED_IDS
#define ID_SIZE 1
#else 
#define ID_SIZE STANDARD_ID_SIZE
#endif

typedef unsigned char heepByte;

unsigned char outputBuffer [OUTPUT_BUFFER_SIZE];
unsigned int outputBufferLastByte = 0;

unsigned char inputBuffer [INPUT_BUFFER_SIZE];
unsigned int inputBufferLastByte = 0;

#include "CommonDataTypes.h"

#ifdef ON_PC
#include "Socket_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#include "Simulation_Timer.h"
#endif

#ifdef ON_ESP8266
#include "ESP8266_HEEPComms.h"
#include "Simulation_NonVolatileMemory"
#include "Arduino_Timer.h"
String SSID = "YOUR_SSID";
String Password = "YOUR_WIFI_PASSWORD";
#endif

#ifdef ON_ARDUINO
#include "ENC28j60_HeepComms.h"
#include "Arduino_EEPROM.h"
#include "Arduino_Timer.h"
#endif

#ifdef SIMULATION
#include "Simulation_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#include "Simulation_Timer.h"
#endif

#ifdef ON_PIC
#include "PICW5500_HeepComms.h"
#include "PICW5500_NonVolatileMemory.h"
#include "PICW5500_Timer.h"
#endif

#include "Scheduler.h"

heepByte deviceIDByte [STANDARD_ID_SIZE] = {0x01, 0x02, 0x03, 0x04};
uint8_t mac[6] = {0x01,0x02,0x03,0x04,0x05,0x06};
