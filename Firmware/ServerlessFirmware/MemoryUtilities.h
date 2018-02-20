#pragma once

#include "CommonDataTypes.h"
#include <stdint.h>
#include "AutoGeneratedInfo.h"

unsigned long GetDataFromBufferOfSpecifiedSize(heepByte* buffer, heepByte* data, unsigned long size, unsigned long counter);

unsigned long GetFullDeviceIDFromBuffer(unsigned char* buffer, heepByte* deviceID, unsigned long counter);

unsigned long GetDeviceIDOrLocalIDFromBuffer(unsigned char* buffer, heepByte* deviceID, unsigned long counter);

int CheckBufferEquality(heepByte* buffer1, heepByte* buffer2, int numBytes);

int CheckDeviceIDEquality(heepByte* deviceID1, heepByte* deviceID2);

unsigned long AddDeviceIDToBuffer_Byte(unsigned char* buffer, heepByte* deviceID, unsigned long counter);

void CopyDeviceID(heepByte* idSend, heepByte* idReturn);
unsigned long GetNumberFromBuffer(unsigned char* buffer, unsigned int* counter, unsigned char numBytes);

unsigned long AddCharToBuffer(unsigned char* buffer, unsigned long startPoint, unsigned char value);

unsigned long AddNumberToBufferWithSpecifiedBytes(unsigned char* buffer, unsigned long number, unsigned long startPoint, int numBytes);

unsigned long AddNumberToBufferWithSpecifiedBytes64Bit(unsigned char* buffer, uint64_t number, unsigned long startPoint, int numBytes);

heepByte GetNumBytes64Bit(uint64_t number);

void AddBufferToBuffer(heepByte* rxBuffer, heepByte* txBuffer, heepByte size, unsigned int *rxCounter, unsigned int *txCounter);

#ifdef USE_ANALYTICS

static const char* base64_chars = 
             "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             "abcdefghijklmnopqrstuvwxyz"
             "0123456789+/";

void base64_encode_Heep(heepByte* deviceID);

#endif