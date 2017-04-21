#include "UnitTestSystem.h"
#include "../ActionAndResponseOpCodes.h"

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

void TestIconIDOpCode()
{
	std::string TestName = "Icon ID Op Code";

	ClearDeviceMemory();
	SetIconIDInMemory(4, 0x01020304);

	ExpectedValue valueList [7];
	valueList[0].valueName = "Icon ID OpCode";
	valueList[0].expectedValue = IconIDOpCode;
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
	valueList[5].expectedValue = 1;
	valueList[5].actualValue = deviceMemory[5];

	valueList[6].valueName = "Letter One";
	valueList[6].expectedValue = 4;
	valueList[6].actualValue = deviceMemory[6];

	CheckResults(TestName, valueList, 7);
}

void TestIconDataOpCode()
{
	std::string TestName = "Icon Data Op Code";

	ClearDeviceMemory();
	char* deviceName = "Jacob";
	SetIconDataInMemory(deviceName, strlen(deviceName), 0x01020304);

	ExpectedValue valueList [11];
	valueList[0].valueName = "Icon Data OpCode";
	valueList[0].expectedValue = CustomIconDrawingOpCode;
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

void TestSetXYOpCode()
{
	std::string TestName = "Front End XY Op Code";

	ClearDeviceMemory();
	SetXYInMemory(312, 513, 0x01020304);

	ExpectedValue valueList [10];
	valueList[0].valueName = "Front End XY OpCode";
	valueList[0].expectedValue = FrontEndPositionOpCode;
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
	valueList[5].expectedValue = 4;
	valueList[5].actualValue = deviceMemory[5];

	valueList[6].valueName = "X High Byte";
	valueList[6].expectedValue = 312 >> 8;
	valueList[6].actualValue = deviceMemory[6];

	valueList[7].valueName = "X Low Byte";
	valueList[7].expectedValue = 312%256;
	valueList[7].actualValue = deviceMemory[7];

	valueList[8].valueName = "Y High Byte";
	valueList[8].expectedValue = 513 >> 8;
	valueList[8].actualValue = deviceMemory[8];

	valueList[9].valueName = "Y Low Byte";
	valueList[9].expectedValue = 513%256;
	valueList[9].actualValue = deviceMemory[9];

	CheckResults(TestName, valueList, 10);
}

void TestSetIPOpCode()
{
	std::string TestName = "Set IP OpCode";

	ClearDeviceMemory();
	HeepIPAddress myIP;
	myIP.Octet4 = 192;
	myIP.Octet3 = 168;
	myIP.Octet2 = 1;
	myIP.Octet1 = 100;
	SetIPInMemory(myIP, 0x01020304);

	ExpectedValue valueList [10];
	valueList[0].valueName = "IP OpCode";
	valueList[0].expectedValue = DeviceIPOpCode;
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
	valueList[5].expectedValue = 4;
	valueList[5].actualValue = deviceMemory[5];

	valueList[6].valueName = "Octet 4";
	valueList[6].expectedValue = 192;
	valueList[6].actualValue = deviceMemory[6];

	valueList[7].valueName = "Octet 3";
	valueList[7].expectedValue = 168;
	valueList[7].actualValue = deviceMemory[7];

	valueList[8].valueName = "Octet 2";
	valueList[8].expectedValue = 1;
	valueList[8].actualValue = deviceMemory[8];

	valueList[9].valueName = "Octet 1";
	valueList[9].expectedValue = 100;
	valueList[9].actualValue = deviceMemory[9];

	CheckResults(TestName, valueList, 10);
}

void TestSetVertexOpCode()
{
	std::string TestName = "Set Vertex OpCode";

	ClearDeviceMemory();
	Vertex myVertex;
	HeepIPAddress myIP;
	myIP.Octet4 = 192;
	myIP.Octet3 = 168;
	myIP.Octet2 = 1;
	myIP.Octet1 = 100;
	myVertex.rxIPAddress = myIP;
	myVertex.txID = 0x01020304;
	myVertex.rxID = 0x09080706;
	myVertex.txControlID = 0x01;
	myVertex.rxControlID = 0x02;
	SetVertexInMemory(myVertex);

	ExpectedValue valueList [16];
	valueList[0].valueName = "Vertex OpCode";
	valueList[0].expectedValue = VertexOpCode;
	valueList[0].actualValue = deviceMemory[0];

	valueList[1].valueName = "Tx Device ID 1";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = deviceMemory[1];

	valueList[2].valueName = "Tx Device ID 2";
	valueList[2].expectedValue = 2;
	valueList[2].actualValue = deviceMemory[2];

	valueList[3].valueName = "Tx Device ID 3";
	valueList[3].expectedValue = 3;
	valueList[3].actualValue = deviceMemory[3];

	valueList[4].valueName = "Tx Device ID 4";
	valueList[4].expectedValue = 4;
	valueList[4].actualValue = deviceMemory[4];

	valueList[5].valueName = "Num Bytes";
	valueList[5].expectedValue = 10;
	valueList[5].actualValue = deviceMemory[5];

	valueList[6].valueName = "Rx Device ID 1";
	valueList[6].expectedValue = 9;
	valueList[6].actualValue = deviceMemory[6];

	valueList[7].valueName = "Rx Device ID 2";
	valueList[7].expectedValue = 8;
	valueList[7].actualValue = deviceMemory[7];

	valueList[8].valueName = "Rx Device ID 3";
	valueList[8].expectedValue = 7;
	valueList[8].actualValue = deviceMemory[8];

	valueList[9].valueName = "Rx Device ID 4";
	valueList[9].expectedValue = 6;
	valueList[9].actualValue = deviceMemory[9];

	valueList[10].valueName = "Tx Control ID";
	valueList[10].expectedValue = 1;
	valueList[10].actualValue = deviceMemory[10];

	valueList[11].valueName = "Rx Control ID";
	valueList[11].expectedValue = 2;
	valueList[11].actualValue = deviceMemory[11];

	valueList[12].valueName = "IP Octet 4";
	valueList[12].expectedValue = 192;
	valueList[12].actualValue = deviceMemory[12];

	valueList[13].valueName = "IP Octet 3";
	valueList[13].expectedValue = 168;
	valueList[13].actualValue = deviceMemory[13];

	valueList[14].valueName = "IP Octet 2";
	valueList[14].expectedValue = 1;
	valueList[14].actualValue = deviceMemory[14];

	valueList[15].valueName = "IP Octet 1";
	valueList[15].expectedValue = 100;
	valueList[15].actualValue = deviceMemory[15];

	CheckResults(TestName, valueList, 16);
}

void TestGetXYFromMemory()
{
	std::string TestName = "Get Front End XY";

	ClearDeviceMemory();
	SetXYInMemory(312, 513, 0x01020304);

	int x = 0; int y = 0; unsigned long deviceID = 0x01020304; unsigned int xyMemPosition = 0; 
	int retVal = GetXYFromMemory(x, y, deviceID, xyMemPosition);

	ExpectedValue valueList [3];
	valueList[0].valueName = "X Position";
	valueList[0].expectedValue = 312;
	valueList[0].actualValue = x;

	valueList[1].valueName = "Y Position";
	valueList[1].expectedValue = 513;
	valueList[1].actualValue = y;

	valueList[2].valueName = "Success Return";
	valueList[2].expectedValue = 0;
	valueList[2].actualValue = retVal;

	CheckResults(TestName, valueList, 3);
}

void TestDynamicMemory()
{
	TestAddCharToBuffer();
	TestAddCharToDeviceMemory();
	TestGetDeviceIDOctets();
	TestClearDeviceMemory();
	TestAddDeviceIDToMemory();
	TestAddDeviceIDToBuffer();
	TestAddIPToDeviceMemory();
	TestDeviceNameOpCode();
	TestIconIDOpCode();
	TestIconDataOpCode();
	TestSetXYOpCode();
	TestSetIPOpCode();
	TestSetVertexOpCode();
	TestGetXYFromMemory();
}