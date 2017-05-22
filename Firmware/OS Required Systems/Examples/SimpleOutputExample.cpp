#include <iostream>
#include "../../ServerlessFirmware/Heep_API.h"

using namespace std;

Control theControl1;
char controlName1 [] = "An Output";
char deviceName  [] = "OS Code";

int main(void)
{
	cout << "Start Heep" << endl;
	
	SetupHeepDevice(deviceName);
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

	while(1)
	{
		PerformHeepTasks();
	}

	return 0;
}
