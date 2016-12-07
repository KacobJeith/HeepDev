#include <iostream>
#include "Client.h"

using namespace std;

ControlValue* theControl;

int main(void)
{
	cout << "Begin Tests" << endl;

	CreateClientFromParams("Test", 1234, 1);

	cout << GetClientName() << endl;

	theControl = new ControlValue();
	theControl->type = 2;
	theControl->highLim = 20;
	AddControlToList(theControl);

	cout << (int)controlList[0]->highLim << endl;

	return 0;
}