#include <iostream>
#include "Client.h"

using namespace std;

ControlValue* theControl;

int main(void)
{
	cout << "Begin Tests" << endl;

	CreateClientFromParams("Test", 1234, 1);

	cout << GetClientName() << endl;

	theControl = CreateControl("TestCtrl", 0, 1, 10, 11);
	AddControlToList(theControl);

	cout << (int)controlList[0]->highLim << endl;

	return 0;
}