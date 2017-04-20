#include <iostream>
#include "ActionAndResponseOpCodes.h"

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

void TestAddCharToBuffer()
{
	std::string TestName = "Add Char to Buffer";

	unsigned char buffer[5];
	int tracker = 0;
	tracker = AddCharToBuffer(buffer, tracker, '2');
	tracker = AddCharToBuffer(buffer, tracker, '5');

	ExpectedValue valueList [2];
	valueList[0].valueName = "Buffered Char 1";
	valueList[0].expectedValue = '2';
	valueList[0].actualValue = buffer[0];

	valueList[1].valueName = "Buffered Char 2";
	valueList[1].expectedValue = '5';
	valueList[1].actualValue = buffer[1];

	CheckResults(TestName, valueList, 2);
}

void TestAddCharToDeviceMemory()
{
	std::string TestName = "Add Char to Device Memory";

	AddNewCharToMemory('3');
	AddNewCharToMemory('6');

	ExpectedValue valueList [2];
	valueList[0].valueName = "Buffered Char 1";
	valueList[0].expectedValue = '3';
	valueList[0].actualValue = deviceMemory[0];

	valueList[1].valueName = "Buffered Char 2";
	valueList[1].expectedValue = '6';
	valueList[1].actualValue = deviceMemory[1];

	CheckResults(TestName, valueList, 2);
}

void TestGetDeviceIDOctets()
{
	std::string TestName = "Get Device Octets";

	unsigned long ID = 0x01020304;
	unsigned char octet1 = 0;
	unsigned char octet2 = 0;
	unsigned char octet3 = 0;
	unsigned char octet4 = 0;

	GetDeviceIDOctets(ID, octet4, octet3, octet2, octet1);

	ExpectedValue valueList [4];
	valueList[0].valueName = "Octet 4";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = octet4;

	valueList[1].valueName = "Octet 3";
	valueList[1].expectedValue = 2;
	valueList[1].actualValue = octet3;

	valueList[1].valueName = "Octet 2";
	valueList[1].expectedValue = 3;
	valueList[1].actualValue = octet2;

	valueList[1].valueName = "Octet 1";
	valueList[1].expectedValue = 4;
	valueList[1].actualValue = octet1;

	CheckResults(TestName, valueList, 4);
}

void TestClearDeviceMemory()
{
	std::string TestName = "Clear Device Memory";

	ClearDeviceMemory();

	AddNewCharToMemory('d');
	AddNewCharToMemory('3');

	ExpectedValue valueList [2];
	valueList[0].valueName = "Memory Size Before Clear";
	valueList[0].expectedValue = 2;
	valueList[0].actualValue = curFilledMemory;

	ClearDeviceMemory();

	valueList[1].valueName = "Memory Size After Clear";
	valueList[1].expectedValue = 0;
	valueList[1].actualValue = curFilledMemory;

	CheckResults(TestName, valueList, 2);
}

void TestAddDeviceIDToMemory()
{
	std::string TestName = "Add Device ID to Device Memory";

	unsigned long ID = 0x09080706;

	ClearDeviceMemory();
	AddDeviceIDToMemory(ID);

	ExpectedValue valueList [4];
	valueList[0].valueName = "Octet 4";
	valueList[0].expectedValue = 9;
	valueList[0].actualValue = deviceMemory[0];

	valueList[1].valueName = "Octet 3";
	valueList[1].expectedValue = 8;
	valueList[1].actualValue = deviceMemory[1];

	valueList[2].valueName = "Octet 2";
	valueList[2].expectedValue =7;
	valueList[2].actualValue = deviceMemory[2];

	valueList[3].valueName = "Octet 1";
	valueList[3].expectedValue = 6;
	valueList[3].actualValue = deviceMemory[3];

	CheckResults(TestName, valueList, 4);
}

void TestAddDeviceIDToBuffer()
{
	std::string TestName = "Add Device ID to Buffer";

	unsigned long ID = 0x09080706;

	unsigned char buffer[5];
	int tracker = 0;
	tracker = AddDeviceIDToBuffer(buffer, tracker, ID);

	ExpectedValue valueList [4];
	valueList[0].valueName = "Octet 4";
	valueList[0].expectedValue = 9;
	valueList[0].actualValue = buffer[0];

	valueList[1].valueName = "Octet 3";
	valueList[1].expectedValue = 8;
	valueList[1].actualValue = buffer[1];

	valueList[2].valueName = "Octet 2";
	valueList[2].expectedValue =7;
	valueList[2].actualValue = buffer[2];

	valueList[3].valueName = "Octet 1";
	valueList[3].expectedValue = 6;
	valueList[3].actualValue = buffer[3];

	CheckResults(TestName, valueList, 4);
}

void TestAddIPToDeviceMemory()
{
	std::string TestName = "Add Device IP to Memory";

	ClearDeviceMemory();
	HeepIPAddress myIP;
	myIP.Octet4 = 192;
	myIP.Octet3 = 100;
	myIP.Octet2 = 1;
	myIP.Octet1 = 100;
	AddIPToMemory(myIP);

	ExpectedValue valueList [4];
	valueList[0].valueName = "Octet 4";
	valueList[0].expectedValue = 192;
	valueList[0].actualValue = deviceMemory[0];

	valueList[1].valueName = "Octet 3";
	valueList[1].expectedValue = 100;
	valueList[1].actualValue = deviceMemory[1];

	valueList[2].valueName = "Octet 2";
	valueList[2].expectedValue =1;
	valueList[2].actualValue = deviceMemory[2];

	valueList[3].valueName = "Octet 1";
	valueList[3].expectedValue = 100;
	valueList[3].actualValue = deviceMemory[3];

	CheckResults(TestName, valueList, 4);
}

void TestDeviceNameOpCode()
{
	std::string TestName = "Device Name Op Code";

	ClearDeviceMemory();
	char* deviceName = "Jacob";
	SetDeviceNameInMemory(deviceName, strlen(deviceName), 0x01020304);

	ExpectedValue valueList [11];
	valueList[0].valueName = "Device Name OpCode";
	valueList[0].expectedValue = DeviceNameOpCode;
	valueList[0].actualValue = deviceMemory[0];

	valueList[1].valueName = "Device ID 1";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = deviceMemory[1];

	valueList[2].valueName = "Device ID 2";
	valueList[2].expectedValue = 2;
	valueList[2].actualValue = deviceMemory[2];

	valueList[3].valueName = "Device ID 3";
	valueList[3].expectedValue = 3;
	valueList[3].actualValue = deviceMemory[3];

	valueList[4].valueName = "Device ID 4";
	valueList[4].expectedValue = 4;
	valueList[4].actualValue = deviceMemory[4];

	valueList[5].valueName = "Num Bytes";
	valueList[5].expectedValue = 5;
	valueList[5].actualValue = deviceMemory[5];

	valueList[6].valueName = "Letter One";
	valueList[6].expectedValue = 'J';
	valueList[6].actualValue = deviceMemory[6];

	valueList[7].valueName = "Letter Two";
	valueList[7].expectedValue = 'a';
	valueList[7].actualValue = deviceMemory[7];

	valueList[8].valueName = "Letter Three";
	valueList[8].expectedValue = 'c';
	valueList[8].actualValue = deviceMemory[8];

	valueList[9].valueName = "Letter Four";
	valueList[9].expectedValue = 'o';
	valueList[9].actualValue = deviceMemory[9];

	valueList[10].valueName = "Letter Five";
	valueList[10].expectedValue = 'b';
	valueList[10].actualValue = deviceMemory[10];

	CheckResults(TestName, valueList, 11);
}

int main(void) 
{
	cout << "Begin Tests" << endl;

	TestAddCharToBuffer();
	TestAddCharToDeviceMemory();
	TestGetDeviceIDOctets();
	TestClearDeviceMemory();
	TestAddDeviceIDToMemory();
	TestAddDeviceIDToBuffer();
	TestAddIPToDeviceMemory();
	TestDeviceNameOpCode();

	return 0;
}