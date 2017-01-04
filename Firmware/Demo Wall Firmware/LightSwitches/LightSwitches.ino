#include "ClientAPI.h"

ControlValue* theControl;
ControlValue* theControl2;

int leftLight = 17;
int rightLight = 16;

void setup()
{
	pinMode(leftLight, OUTPUT);
	digitalWrite(leftLight, LOW);
	pinMode(rightLight, OUTPUT);
	digitalWrite(rightLight, LOW);

	Serial.begin(9600);
	delay(1000);
	Serial.println("START");
	
	CreateClientFromParams("DualLight", 12345, 1);
	theControl = CreateControl("Left", 0, 0, 0, 1);
	AddControlToList(theControl);
	theControl2 = CreateControl("Right", 0, 0, 0, 1);
	AddControlToList(theControl2);

	Serial.println(GetClientString());

	ConnectToPLCServer();

	SendNewConnect();

	CreateInterruptServer();
}

int state = 0;

void loop()
{
	CheckInterrupts();

	if(controlList[0]->curVal == 0)
	{
		digitalWrite(leftLight, 0);
	}
	else if(controlList[0]->curVal == 1)
	{
		digitalWrite(leftLight, 1);
	}

	if(controlList[1]->curVal == 0)
	{
		digitalWrite(rightLight, 0);
	}
	else if(controlList[1]->curVal == 1)
	{
		digitalWrite(rightLight, 1);
	}
	
	//Serial.println("Test");
}