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

void TestActionAndResponseOpCodes()
{
	TestClearOutputBufferAndAddChar();
	TestMemoryDumpROP();
}