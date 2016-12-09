#include <iostream>
#include "ClientAPI.h"

// 1319 WITH UIP; 307 not using UIP but included;  70 no UIP;

using namespace std;

ControlValue* theControl;
ControlValue* theControl2;
Vertex* vertex1;

int main(void)
{
	cout << "Begin Tests" << endl;

	char myTest [] = "Test";
	CreateClientFromParams(myTest, 1234, 1);

	cout << GetClientName() << endl;

	char testCtrl1 [] = "TestCtrl";
	theControl = CreateControl(testCtrl1, 0, 1, 10, 11);
	AddControlToList(theControl);

	char testCtrl2 [] = "TestCtrl2";
	theControl2 = CreateControl(testCtrl2, 0, 1, 15, 8);
	AddControlToList(theControl2);

	cout << (int)controlList[0]->highLim << endl;

	cout << GetClientString() << endl;

	cout << GetIsPLCServerCommand() << endl;
	cout << GetNewConnectCommand() << endl;

	ClearString(PLCInputBuffer, PLC_INPUT_BUFFER_SIZE);
	CopyStringToBuffer(PLCInputBuffer, "input,output,myIP,12,34");
	cout << PLCInputBuffer << endl;
	vertex1 = CreateVertexFromString(PLCInputBuffer);
	cout << vertex1->inputName << endl;
	cout << vertex1->outputName << endl;
	cout << vertex1->destIP << endl;
	cout << vertex1->destinationID << endl;

	return 0;
}