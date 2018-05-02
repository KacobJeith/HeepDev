#pragma once
#include "CommonDataTypes.h"
#include <Arduino.h>

void CreateInterruptServer();
void CheckServerForInputs();
void SendOutputBufferToIP(struct HeepIPAddress destIP);

void BroadcastOutputBuffer();
void GetCurrentIP(struct HeepIPAddress* destIP);

#ifdef USE_ANALYTICS

static const char* base64_chars_esp = 
             "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             "abcdefghijklmnopqrstuvwxyz"
             "0123456789+/";

String base64_encode(const char* bytes_to_encode, unsigned int in_len);
void SendDataToFirebase(heepByte *buffer, int length, heepByte* base64IDBuffer, int base64IDLength);

#endif