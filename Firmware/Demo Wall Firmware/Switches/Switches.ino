#include "ClientAPI.h"

ControlValue* theControl;
ControlValue* theControl2;

int switchLeft = 16;
int switchRight = 17;

void setup()
{
	Serial.begin(9600);
	delay(1000);
	Serial.println("START");

	pinMode(switchLeft, INPUT);
	digitalWrite(switchLeft, HIGH);
	pinMode(switchRight, INPUT);
	digitalWrite(switchRight, HIGH);
	
	CreateClientFromParams("DualSwitch", 7353, 1);
	theControl = CreateControl("Left", 1, 0, 0, 1);
	AddControlToList(theControl);
	theControl2 = CreateControl("Right", 1, 0, 0, 1);
	AddControlToList(theControl2);

	Serial.println(GetClientString());

	ConnectToPLCServer();

	SendNewConnect();
}

int stateLeft = 0;
int stateRight = 0;

void loop()
{
	if(digitalRead(switchLeft) != stateLeft)
	{
		SendGetClientVertices();
		stateLeft = digitalRead(switchLeft);
		SendOutput("Left", stateLeft);
		Serial.println("Sent Right");
	}

	if(digitalRead(switchRight) != stateRight)
	{
		SendGetClientVertices();
		stateRight = digitalRead(switchRight);
		SendOutput("Right", stateRight);
		Serial.println("Sent Left");
	}
}