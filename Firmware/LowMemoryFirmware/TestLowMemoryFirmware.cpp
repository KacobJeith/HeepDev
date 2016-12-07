#include <iostream>
#include "ClientAPI.h"

using namespace std;

ControlValue* theControl;
ControlValue* theControl2;

int main(void)
{
	cout << "Begin Tests" << endl;

	CreateClientFromParams("Test", 1234, 1);

	cout << GetClientName() << endl;

	theControl = CreateControl("TestCtrl", 0, 1, 10, 11);
	AddControlToList(theControl);

	theControl2 = CreateControl("TestingCtrl2", 0, 1, 15, 8);
	AddControlToList(theControl2);

	cout << (int)controlList[0]->highLim << endl;

	cout << GetClientString() << endl;

	cout << GetNewConnectCommand() << endl;

	return 0;
}