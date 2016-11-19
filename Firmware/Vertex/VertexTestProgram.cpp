#include <iostream>
#include "Vertex.h"
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

void TestConstructor()
{
	std::string TestName = "Vertex Constructor Test";

	Vertex vert("input", "output", "myIP", 12, 34);

	// std::string expectedName = "Test";
	// std::string actualName = test.GetControlName();
	// int isValueCorrect = 0;
	// if(actualName == expectedName)
	// 	isValueCorrect = 1;

	// ExpectedValue valueList [3];
	// valueList[0].valueName = "Control Direction";
	// valueList[0].expectedValue = 1;
	// valueList[0].actualValue = test.GetControlDirection();

	// valueList[1].valueName = "Control Type";
	// valueList[1].expectedValue = 1;
	// valueList[1].actualValue = test.GetControlType();

	// valueList[2].valueName = "Control Name";
	// valueList[2].expectedValue = 1;
	// valueList[2].actualValue = isValueCorrect;

	// CheckResults(TestName, valueList, 3);
}

int main(void)
{
	cout << "Test Beginning" << endl;
	TestConstructor();

	return 0;
}