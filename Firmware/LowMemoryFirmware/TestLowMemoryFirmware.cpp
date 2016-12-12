#include <iostream>
#include "ClientAPI.h"

// 1319 WITH UIP; 307 not using UIP but included;  70 no UIP;

using namespace std;

struct ExpectedValue
{
	std::string valueName;
	int expectedValue;
	int actualValue;
};

void OnSuccess(std::string testName)
{
	cout << testName << ": " << "Passed" << endl;
}

void OnFailure(std::string testName)
{
	cout << testName << ": " << "Failed" << endl;
}

void ListExpected(ExpectedValue value)
{
	cout << "    " << value.valueName << " - Expected: " << value.expectedValue << " Found: " << value.actualValue << endl;
}

void CheckResults(std::string testName, ExpectedValue valueList [], int numberOfValues)
{
	for(int i = 0; i < numberOfValues; i++)
	{
		if(valueList[i].expectedValue != valueList[i].actualValue)
		{
			OnFailure(testName);

			for(int j = 0; j < numberOfValues; j++)
			{
				ListExpected(valueList[j]);
			}

			return;
		}
	}

	OnSuccess(testName);
}

void TestSetFromControlString()
{
	std::string TestName = "Set from Control String Test";

	char vertexString [] = "input,TestCtrl,myIP,12,34;Input2,TestCtrl2,anIP,14,34;";
	ClearString(PLCInputBuffer, PLC_INPUT_BUFFER_SIZE);
	CopyStringToBuffer(PLCInputBuffer, vertexString);
	AddVerticesFromString(PLCInputBuffer);

	std::string expectedName0 = "input";
	std::string actualName0 = vertexList[0]->inputName;
	int isName0Correct = 0;
	if(actualName0 == expectedName0)
		isName0Correct = 1;

	std::string expectedName1 = "Input2";
	std::string actualName1 = vertexList[1]->inputName;
	int isName1Correct = 0;
	if(actualName1 == expectedName1)
		isName1Correct = 1;

	std::string expectedOutput0 = "TestCtrl";
	std::string actualOutput0 = vertexList[0]->outputName;
	int isOut0Correct = 0;
	if(expectedOutput0 == actualOutput0)
		isOut0Correct = 1;

	std::string expectedOutput1 = "TestCtrl2";
	std::string actualOutput1 = vertexList[1]->outputName;
	int isOut1Correct = 0;
	if(expectedOutput1 == actualOutput1)
		isOut1Correct = 1;

	ExpectedValue valueList [6];
	valueList[0].valueName = "Destination ID 0";
	valueList[0].expectedValue = 12;
	valueList[0].actualValue = vertexList[0]->destinationID;

	valueList[1].valueName = "Destination ID 1";
	valueList[1].expectedValue = 14;
	valueList[1].actualValue = vertexList[1]->destinationID;

	valueList[2].valueName = "Input Name 0";
	valueList[2].expectedValue = 1;
	valueList[2].actualValue = isName0Correct;

	valueList[3].valueName = "Input Name 1";
	valueList[3].expectedValue = 1;
	valueList[3].actualValue = isName1Correct;

	valueList[4].valueName = "Output Name 0";
	valueList[4].expectedValue = 1;
	valueList[4].actualValue = isOut0Correct;

	valueList[5].valueName = "Output Name 1";
	valueList[5].expectedValue = 1;
	valueList[5].actualValue = isOut1Correct;

	CheckResults(TestName, valueList, 6);
}

void TestGetClientString()
{
	std::string TestName = "Test Get Client String";

	ControlValue* theControl;
	ControlValue* theControl2;
	Vertex* vertex1;

	char myTest [] = "Test";
	CreateClientFromParams(myTest, 1234, 1);

	char testCtrl1 [] = "TestCtrl";
	theControl = CreateControl(testCtrl1, 0, 1, 10, 11);
	AddControlToList(theControl);

	char testCtrl2 [] = "TestCtrl2";
	theControl2 = CreateControl(testCtrl2, 0, 1, 15, 8);
	AddControlToList(theControl2);

	std::string clientString = GetClientString();
	std::string expectedClientString = "1234,0,1,Test,0,None,0,1,TestCtrl,11,10,0,1,TestCtrl2,8,15";
	int isStringCorrect = 0;
	if(clientString == expectedClientString)
		isStringCorrect = 1;

	ExpectedValue valueList [1];
	valueList[0].valueName = "Client String";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = isStringCorrect;


	CheckResults(TestName, valueList, 1);
}

void TestIsPLCServerCommand()
{
	std::string TestName = "Test Is PLC Server Cmd";

	std::string clientString = GetIsPLCServerCommand();
	std::string expectedClientString = "IsPLCServer:";
	int isStringCorrect = 0;
	if(clientString == expectedClientString)
		isStringCorrect = 1;

	ExpectedValue valueList [1];
	valueList[0].valueName = "PLC Server";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = isStringCorrect;


	CheckResults(TestName, valueList, 1);
}

ControlValue* theControl;
ControlValue* theControl2;
Vertex* vertex1;

int main(void)
{
	cout << "Begin Tests" << endl;

	TestSetFromControlString();
	TestGetClientString();
	TestIsPLCServerCommand();

	cout << GetNewConnectCommand() << endl;

	SendOutput("TestCtrl2", 2);
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

	cout << "Done" << endl;

	return 0;
}