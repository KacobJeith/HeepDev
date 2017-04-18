#include "DeviceMemory.h"

unsigned long deviceID;
unsigned int firmwareVersion = FIRMWARE_VERSION;

Control controlList [NUM_CONTROLS];
unsigned char numberOfControls;

void SetDeviceIDAndName(unsigned long newDeviceID, char* deviceName)
{
	deviceID = newDeviceID;

	int deviceNameLength = strlen(deviceName);
	SetDeviceNameInMemory(deviceName, deviceNameLength, newDeviceID);
}