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

void TestHeepAPI()
{
	TestSchedulerRolloverProtection();
}