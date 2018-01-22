#include "../Heep_API.h"
#include "UnitTestSystem.h"

void TestSchedulerRolloverProtection()
{
	std::string TestName = "Test Scheduler Overflow Protection";

	ScheduleTask(1);
	ScheduleTask(2);

	// Create largest possible Long minus a few
	simMillis =  ( (unsigned long)-1 ) - 100;

	unsigned char firstTakTime = IsTaskTime();
	unsigned long startingValue = simMillis;
	unsigned long firstLastMillis = lastMillis;

	for (int i = 0; i < 100; i++)
	{
		IsTaskTime();
	}

	unsigned long overFlowedLastMillis = lastMillis;

	ExpectedValue valueList [3];
	valueList[0].valueName = "Before Overflow Times";
	valueList[0].expectedValue = startingValue;
	valueList[0].actualValue = firstLastMillis;

	valueList[1].valueName = "Initial Task Time";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = firstTakTime;

	valueList[2].valueName = "Overflowed last millis";
	valueList[2].expectedValue = 0;
	valueList[2].actualValue = overFlowedLastMillis;

	CheckResults(TestName, valueList, 3);
}

void TestBufferControlType()
{
	std::string TestName = "Test Buffer Control Type";

	heepByte bufferControl [10];
	Control theControl;
	theControl.highValue = 10;
	theControl.controlBuffer = bufferControl;

	for(int i = 0; i < theControl.highValue; i++)
	{
		theControl.controlBuffer[i] = i;
	}

	ExpectedValue valueList [10];

	for(int i = 0; i < 10; i++)
	{
		valueList[i].valueName = std::string("Value at position ") + std::to_string(i);
		valueList[i].expectedValue = i;
		valueList[i].actualValue = theControl.controlBuffer[i];
	}

	CheckResults(TestName, valueList, 10);
}

void TestAnalyticsMillisecondsBytes()
{
	std::string TestName = "Test Analytics Time Keeping";

	simMillis = 200;
	int numBytesShouldBe1 = GetNumBytesForCurrentTime();
	simMillis = 400;
	int numBytesShouldBe2 = GetNumBytesForCurrentTime();
	simMillis =  1125899906842624;
	int numBytesShouldBe7 = GetNumBytesForCurrentTime();

	ExpectedValue valueList [3];
	valueList[0].valueName = "One Byte Number";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = numBytesShouldBe1;

	valueList[1].valueName = "Two Byte Number";
	valueList[1].expectedValue = 2;
	valueList[1].actualValue = numBytesShouldBe2;

	valueList[2].valueName = "Seven Byte Number";
	valueList[2].expectedValue = 7;
	valueList[2].actualValue = numBytesShouldBe7;

	CheckResults(TestName, valueList, 3);
}

void TestHeepAPI()
{
	TestSchedulerRolloverProtection();
	TestBufferControlType();
	TestAnalyticsMillisecondsBytes();
}