#include "ClientAPI.h"

ControlValue* theControl;

int outlet = 16;

void setup()
{
	pinMode(outlet, OUTPUT);
	digitalWrite(outlet, LOW);

	Serial.begin(9600);
	delay(1000);
	Serial.println("START");
	
	CreateClientFromParams("Outlet", 44578, 1);
	theControl = CreateControl("Power", 0, 0, 0, 1);
	AddControlToList(theControl);

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
		digitalWrite(outlet, 0);
	}
	else if(controlList[0]->curVal == 1)
	{
		digitalWrite(outlet, 1);
	}
}