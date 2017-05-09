#include "Heep_API.h"

char controlName1 [] = "Relay";
char deviceName  [] = "Backpack Outlet";

Control theControl1;

int outlet = 23;

//#define CLEAR_MEMORY

void setup()
{
	Serial.begin(9600);
	delay(1000);
	Serial.println("START");

#ifdef CLEAR_MEMORY
	ClearMemory();
#else
	Serial.println("Reading Memory...");
	ReadMemory(deviceMemory, curFilledMemory);
#endif

	pinMode(outlet, OUTPUT);
	digitalWrite(outlet, LOW);

	SetDeviceID(0x12345678);
	SetDeviceName(deviceName);
	theControl1.controlName = controlName1;
	theControl1.controlID = 0;
	theControl1.controlDirection = 0;
	theControl1.controlType = 0;
	theControl1.highValue = 100;
	theControl1.lowValue = 0;
	theControl1.curValue = 0;
	AddControl(theControl1);

	SetupHeepTasks();
	CreateInterruptServer();
}

void loop()
{
	PerformHeepTasks();

	if(controlList[0].curValue == 1)
	{
		digitalWrite(outlet, 1);
	}
	else
	{
		digitalWrite(outlet, 0);
	}

}