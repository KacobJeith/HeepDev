#include <iostream>
#include "ControlValue.h"
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

void TestGetControlByName()
{
	std::string TestName = "Get Control By Name Test";

	ControlValue testInput("Test Input", ControlValue::input, ControlValue::Range);
	ControlValue testOutput("Test Output", ControlValue::output, ControlValue::Range);

	ControlValNode* head = InitializeControlList(testInput);
	AddControlToList(head, testOutput);

	ControlValue testReader;
	GetControlByName(head, "Test Output", testReader);

	ExpectedValue valueList [1];
	valueList[0].valueName = "Control Direction Head";
	valueList[0].expectedValue = ControlValue::output;
	valueList[0].actualValue = testReader.GetControlDirection();

	CheckResults(TestName, valueList, 1);
}

void TestControlList()
{
	std::string TestName = "Control List Test";

	ControlValue testInput("Test Input", ControlValue::input, ControlValue::Range);
	ControlValue testOutput("Test Output", ControlValue::output, ControlValue::Range);

	ControlValNode* head = InitializeControlList(testInput);
	AddControlToList(head, testOutput);

	ExpectedValue valueList [2];
	valueList[0].valueName = "Control Direction Head";
	valueList[0].expectedValue = ControlValue::input;
	valueList[0].actualValue = head->controlData.GetControlDirection();

	valueList[1].valueName = "Control Direction Next";
	valueList[1].expectedValue = ControlValue::output;
	valueList[1].actualValue = head->next->controlData.GetControlDirection();

	CheckResults(TestName, valueList, 2);
}

void TestConstructor()
{
	std::string TestName = "Control Value Constructor Test";

	ControlValue test("Test", ControlValue::input, ControlValue::Range);

	std::string ExpectedName = "Test";
	std::string ReceivedName = test.GetControlName();

	int nameDidPass = 0;
	if(ExpectedName == ReceivedName)
	{
		nameDidPass = 1;
	}

	ExpectedValue valueList [3];
	valueList[0].valueName = "Control Direction";
	valueList[0].expectedValue = ControlValue::input;
	valueList[0].actualValue = test.GetControlDirection();

	valueList[1].valueName = "Control Name";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = nameDidPass;

	valueList[2].valueName = "Control Type";
	valueList[2].expectedValue = ControlValue::Range;
	valueList[2].actualValue = test.GetControlType();

	CheckResults(TestName, valueList, 3);
}

int main(void)
{
	cout << "Test Beginning" << endl;

	TestConstructor();
	TestControlList();
	TestGetControlByName();

	return 0;
}