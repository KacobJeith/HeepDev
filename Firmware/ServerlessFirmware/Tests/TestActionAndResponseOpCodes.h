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
	SetDeviceIDAndName(0x01020304, "Jacob");
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
	SetDeviceIDAndName(0x01020304, "Jacob");
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
	SetDeviceIDAndName(0x06040601, "Test");
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
	SetDeviceIDAndName(0x06040601, "Test");
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

void TestActionAndResponseOpCodes()
{
	TestClearOutputBufferAndAddChar();
	TestMemoryDumpROP();
	TestHeepDeviceCOP();
	TestNumberFromBuffer();
	TestSetValSuccess();
	TestSetValFailure();
}