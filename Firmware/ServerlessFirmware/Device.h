#include "DeviceMemory.h"

unsigned long deviceID;
unsigned int firmwareVersion = FIRMWARE_VERSION;

Control controlList [NUM_CONTROLS];
unsigned char outputBuffer [OUTPUT_BUFFER_SIZE];
unsigned char numberOfControls = 0;

void AddControl(Control myControl)
{
	controlList[numberOfControls] = myControl;
	numberOfControls++;
}

void SetDeviceIDAndName(unsigned long newDeviceID, char* deviceName)
{
	deviceID = newDeviceID;

	int deviceNameLength = strlen(deviceName);
	SetDeviceNameInMemory(deviceName, deviceNameLength, newDeviceID);
}

void FillBufferWithMemoryDump()
{

}