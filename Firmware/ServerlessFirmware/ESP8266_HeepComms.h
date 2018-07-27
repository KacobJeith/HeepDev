#pragma once
#include "CommonDataTypes.h"
#include <Arduino.h>

void CreateInterruptServer();
void CheckServerForInputs();
void SendOutputBufferToIP(struct HeepIPAddress destIP);

#ifdef USE_ANALYTICS

static const char* base64_chars_esp = 
             "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             "abcdefghijklmnopqrstuvwxyz"
             "0123456789+/";

String base64_encode(const char* bytes_to_encode, unsigned int in_len);
void SendDataToFirebase(heepByte *buffer, int length, heepByte* deviceID);


void PostNameToFirebase(char* deviceName, int nameLength, heepByte* deviceID);
void PostControlToFirebase(int controlID, int controlType, int controlDirection, int highValue, int lowValue, char* controlName, heepByte* deviceID);

uint64_t GetRealTimeFromNetwork();

#endif