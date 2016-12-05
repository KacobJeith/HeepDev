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

void TestSetFromControlString()
{
	std::string TestName = "Set from Control String Test";

	ControlValue test("1,1,Test,0,10");

	std::string expectedName = "Test";
	std::string actualName = test.GetControlName();
	int isValueCorrect = 0;
	if(actualName == expectedName)
		isValueCorrect = 1;

	ExpectedValue valueList [3];
	valueList[0].valueName = "Control Direction";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = test.GetControlDirection();

	valueList[1].valueName = "Control Type";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = test.GetControlType();

	valueList[2].valueName = "Control Name";
	valueList[2].expectedValue = 1;
	valueList[2].actualValue = isValueCorrect;

	CheckResults(TestName, valueList, 3);
}

void TestGetControlString()
{
	std::string TestName = "Get Control String Test";

	ControlValue test("Test", ControlValue::output, ControlValue::Range);

	std::string controlOut = test.GetControlString();
	std::string correctString = "1,1,Test,0,10";

	int isValueCorrect = 0;
	if(controlOut == correctString)
	{
		isValueCorrect = 1;
	}

	ExpectedValue valueList [1];
	valueList[0].valueName = "Control String";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = isValueCorrect;

	CheckResults(TestName, valueList, 1);
}

void TestAddControlToList()
{
	std::string TestName = "Add Control To List Test";

	ControlValue test1("ONE", ControlValue::input, ControlValue::Range);
	ControlValue test2("TWO", ControlValue::output, ControlValue::Range);

	ControlValList valList(2);
	valList.AddControlValToList(test1);
	valList.AddControlValToList(test2);

	ExpectedValue valueList [2];
	valueList[0].valueName = "Control Direction One";
	valueList[0].expectedValue = ControlValue::input;
	valueList[0].actualValue = valList.GetControlAtIndex(0).GetControlDirection();

	valueList[1].valueName = "Control Direction Two";
	valueList[1].expectedValue = ControlValue::output;
	valueList[1].actualValue = valList.GetControlAtIndex(1).GetControlDirection();

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
	cout << "Control Test Beginning" << endl;

	TestConstructor();
	TestAddControlToList();
	TestGetControlString();
	TestSetFromControlString();

	return 0;
}