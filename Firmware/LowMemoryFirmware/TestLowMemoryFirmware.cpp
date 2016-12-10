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
	CopyStringToBuffer(PLCInputBuffer, "input,TestCtrl,myIP,12,34;Input2,TestCtrl,anIP,14,34;");
	cout << PLCInputBuffer << endl;
	AddVerticesFromString(PLCInputBuffer);
	cout << vertexList[0]->inputName << endl;
	cout << vertexList[0]->outputName << endl;
	cout << vertexList[0]->destIP << endl;
	cout << vertexList[0]->destinationID << endl;
	cout << vertexList[1]->inputName << endl;
	cout << vertexList[1]->outputName << endl;
	cout << vertexList[1]->destIP << endl;
	cout << vertexList[1]->destinationID << endl;

	SendOutput("TestCtrl", 2);
	for(int i = 0; i < numVerticesAdded; i++)
	{
		if(vertexList[i]->shouldOutput)
		{
			cout << vertexList[i]->inputName << endl;
			cout << (int)vertexList[i]->value << endl;
		}
	}

	cout << GetClientVertexCommand() << endl;

	char fakeIP [] = "192.158.1.22";
	SendDataToPLCClient(PLCOutputBuffer, PLCInputBuffer, fakeIP);

	return 0;
}