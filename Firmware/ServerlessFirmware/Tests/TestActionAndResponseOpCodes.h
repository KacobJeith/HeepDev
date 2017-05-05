#include "../ActionAndResponseOpCodes.h"
#include "UnitTestSystem.h"

void TestClearOutputBufferAndAddChar()
{
	std::string TestName = "Add Char to Output Buffer and Clear";

	ClearOutputBuffer();
	AddNewCharToOutputBuffer('3');

	ExpectedValue valueList [2];
	valueList[0].valueName = "Num Chars before clear";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = outputBufferLastByte;

	ClearOutputBuffer();

	valueList[1].valueName = "Num Chars after clear";
	valueList[1].expectedValue = 0;
	valueList[1].actualValue = outputBufferLastByte;

	CheckResults(TestName, valueList, 2);
}

void TestMemoryDumpROP()
{
	std::string TestName = "Memory Dump ROP";

	ClearDeviceMemory();
	SetDeviceID(0x01020304);
	SetDeviceName("Jacob");
	ClearOutputBuffer();
	FillOutputBufferWithMemoryDump();

	ExpectedValue valueList[10];
	valueList[0].valueName = "Memory Dump";
	valueList[0].expectedValue = MemoryDumpOpCode;
	valueList[0].actualValue = outputBuffer[0];

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

	CheckResults(TestName, valueList, 5);
}

void TestHeepDeviceCOP()
{
	std::string TestName = "Is Heep Device COP";

	ClearDeviceMemory();
	SetDeviceID(0x01020304);
	SetDeviceName("Jacob");
	ClearOutputBuffer();
	ClearInputBuffer();

	inputBuffer[0] = 0x09;
	inputBuffer[1] = 0x00;
	ExecuteControlOpCodes();

	ExpectedValue valueList[10];
	valueList[0].valueName = "Memory Dump";
	valueList[0].expectedValue = MemoryDumpOpCode;
	valueList[0].actualValue = outputBuffer[0];

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

	CheckResults(TestName, valueList, 5);
}

void TestNumberFromBuffer()
{
	std::string TestName = "Get Number from Buffer";

	unsigned char myBuffer [4];
	myBuffer[0] = 0x01;
	myBuffer[1] = 0xFF;

	unsigned int counter = 0;
	unsigned int retVal = GetNumberFromBuffer(myBuffer, counter, 2);

	ExpectedValue valueList[1];
	valueList[0].valueName = "Returned Number";
	valueList[0].expectedValue = 511;
	valueList[0].actualValue = retVal;

	CheckResults(TestName, valueList, 1);
}

void TestSetValSuccess()
{
	std::string TestName = "Test Set Val COP";

	ClearControls();
	SetDeviceID(0x06040601);
	SetDeviceName("Test");
	Control theControl;
	theControl.controlName = "Test Control";
	theControl.controlID = 0;
	theControl.controlDirection = 1;
	theControl.controlType = 1;
	theControl.highValue= 100;
	theControl.lowValue = 0;
	theControl.curValue = 50;
	AddControl(theControl);

	ClearInputBuffer();
	inputBuffer[0] = 0x0A;
	inputBuffer[1] = 0x02;
	inputBuffer[2] = 0x00;
	inputBuffer[3] = 0x04;
	ExecuteControlOpCodes();

	ExpectedValue valueList[2];
	valueList[0].valueName = "Returned Op Code";
	valueList[0].expectedValue = SuccessOpCode;
	valueList[0].actualValue = outputBuffer[0];

	valueList[1].valueName = "Control Value";
	valueList[1].expectedValue = 4;
	valueList[1].actualValue = GetControlValueByID(0);

	CheckResults(TestName, valueList, 2);
}

void TestSetValFailure()
{
	std::string TestName = "Test Set Val COP Failures";

	ClearControls();
	SetDeviceID(0x06040601);
	SetDeviceName("Test");
	Control theControl;
	theControl.controlName = "Test Control";
	theControl.controlID = 0;
	theControl.controlDirection = 1;
	theControl.controlType = 1;
	theControl.highValue= 100;
	theControl.lowValue = 0;
	theControl.curValue = 50;
	AddControl(theControl);

	ClearInputBuffer();
	inputBuffer[0] = 0x0A;
	inputBuffer[1] = 0x02;
	inputBuffer[2] = 0x01;
	inputBuffer[3] = 0x04;
	ExecuteControlOpCodes();

	ExpectedValue valueList[2];
	valueList[0].valueName = "Returned Op Code";
	valueList[0].expectedValue = ErrorOpCode;
	valueList[0].actualValue = outputBuffer[0];

	valueList[1].valueName = "Control Value";
	valueList[1].expectedValue = 50;
	valueList[1].actualValue = GetControlValueByID(0);

	CheckResults(TestName, valueList, 2);
}

void TestSetPositionOpCode()
{
	std::string TestName = "Test Set Position COP";

	ClearControls();
	SetDeviceID(0x06040601);
	SetDeviceName("Test");

	ClearInputBuffer();
	inputBuffer[0] = 0x0B;
	inputBuffer[1] = 0x04;
	inputBuffer[2] = 0x01;
	inputBuffer[3] = 0x01;
	inputBuffer[4] = 0x10;
	inputBuffer[5] = 0x10;
	ExecuteControlOpCodes();
	int x = 0; int y = 0; unsigned long deviceID = 0x06040601; unsigned int xyMemPosition = 0; 
	GetXYFromMemory(x, y, deviceID, xyMemPosition);

	ExpectedValue valueList[4];
	valueList[0].valueName = "x";
	valueList[0].expectedValue = 0x0101;
	valueList[0].actualValue = x;

	valueList[1].valueName = "y";
	valueList[1].expectedValue = 0x1010;
	valueList[1].actualValue = y;

	ClearInputBuffer();
	inputBuffer[0] = 0x0B;
	inputBuffer[1] = 0x04;
	inputBuffer[2] = 0xF1;
	inputBuffer[3] = 0x02;
	inputBuffer[4] = 0xB2;
	inputBuffer[5] = 0x3C;
	ExecuteControlOpCodes();
	GetXYFromMemory(x, y, deviceID, xyMemPosition);

	valueList[2].valueName = "x";
	valueList[2].expectedValue = 0xF102;
	valueList[2].actualValue = x;

	valueList[3].valueName = "y";
	valueList[3].expectedValue = 0xB23C;
	valueList[3].actualValue = y;

	CheckResults(TestName, valueList, 4);
}

void TestSetVertxCOP()
{
	std::string TestName = "Test Set Vertex COP";

	ClearDeviceMemory();
	ClearInputBuffer();

	inputBuffer[0] = 0x0C;
	inputBuffer[1] = 0x04;

	inputBuffer[2] = 0xF1;
	inputBuffer[3] = 0x02;
	inputBuffer[4] = 0xB2;
	inputBuffer[5] = 0x3C;

	inputBuffer[6] = 0x1A;
	inputBuffer[7] = 0x2D;
	inputBuffer[8] = 0x40;
	inputBuffer[9] = 0x02;

	inputBuffer[10] = 0x01;
	inputBuffer[11] = 0x02;

	inputBuffer[12] = 0xC0;
	inputBuffer[13] = 0xD0;
	inputBuffer[14] = 0x20;
	inputBuffer[15] = 0x02;
	ExecuteControlOpCodes();

	Vertex newVertex;
	int success = GetVertexAtPonter(0, newVertex);

	ExpectedValue valueList [8];
	valueList[0].valueName = "TXID";
	valueList[0].expectedValue = 0xF102B23C;
	valueList[0].actualValue = newVertex.txID;

	valueList[1].valueName = "RXID";
	valueList[1].expectedValue = 0x1A2D4002;
	valueList[1].actualValue = newVertex.rxID;

	valueList[2].valueName = "TX Control ID";
	valueList[2].expectedValue = 0x01;
	valueList[2].actualValue = newVertex.txControlID;

	valueList[3].valueName = "RX Control ID";
	valueList[3].expectedValue = 0x02;
	valueList[3].actualValue = newVertex.rxControlID;

	valueList[4].valueName = "IP 4";
	valueList[4].expectedValue = 0xC0;
	valueList[4].actualValue = newVertex.rxIPAddress.Octet4;

	valueList[5].valueName = "IP 3";
	valueList[5].expectedValue = 0xD0;
	valueList[5].actualValue = newVertex.rxIPAddress.Octet3;

	valueList[6].valueName = "IP 2";
	valueList[6].expectedValue = 0x20;
	valueList[6].actualValue = newVertex.rxIPAddress.Octet2;

	valueList[7].valueName = "IP 1";
	valueList[7].expectedValue = 0x02;
	valueList[7].actualValue = newVertex.rxIPAddress.Octet1;

	CheckResults(TestName, valueList, 8);
}

void TestActionAndResponseOpCodes()
{
	TestClearOutputBufferAndAddChar();
	TestMemoryDumpROP();
	TestHeepDeviceCOP();
	TestNumberFromBuffer();
	TestSetValSuccess();
	TestSetValFailure();
	TestSetPositionOpCode();
	TestSetVertxCOP();
}