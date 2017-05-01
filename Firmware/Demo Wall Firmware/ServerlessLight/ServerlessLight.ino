#include "Heep_API.h"

char controlName1 [] = "Right Bulb";
char controlName2 [] = "Left Bulb";
char deviceName  [] = "Demo Wall Light Bulbs";

Control theControl1;
Control theControl2;

int rightLight = 17;
int leftLight = 16;

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

	pinMode(rightLight, OUTPUT);
	pinMode(leftLight, OUTPUT);
	digitalWrite(rightLight, LOW);
	digitalWrite(leftLight, LOW);

	SetDeviceID(0x01223215);
	SetDeviceName(deviceName);
	theControl1.controlName = controlName1;
	theControl1.controlID = 0;
	theControl1.controlDirection = 0;
	theControl1.controlType = 0;
	theControl1.highValue = 100;
	theControl1.lowValue = 0;
	theControl1.curValue = 0;
	AddControl(theControl1);

	theControl2.controlName = controlName2;
	theControl2.controlID = 1;
	theControl2.controlDirection = 0;
	theControl2.controlType = 0;
	theControl2.highValue = 100;
	theControl2.lowValue = 0;
	theControl2.curValue = 0;
	AddControl(theControl2);

	SetupHeepTasks();
	CreateInterruptServer();
}

void loop()
{
	CheckServerForInputs();
	PerformHeepTasks();

	if(controlList[0].curValue == 1)
	{
		digitalWrite(rightLight, 1);
	}
	else
	{
		digitalWrite(rightLight, 0);
	}

	if(controlList[1].curValue == 1)
	{
		digitalWrite(leftLight, 1);
	}
	else
	{
		digitalWrite(leftLight, 0);
	}	
}