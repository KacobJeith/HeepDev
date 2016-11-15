#include <iostream>
#include "Client.h"
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
	std::string TestName = "Client Name Test";

	Client test(10, "Test");

	std::string ExpectedName = "Test";
	std::string ReceivedName = test.GetClientName();

	int nameDidPass = 0;
	if(ExpectedName == ReceivedName)
	{
		nameDidPass = 1;
	}

	ExpectedValue valueList [2];
	valueList[0].valueName = "Client ID Value";
	valueList[0].expectedValue = 10;
	valueList[0].actualValue = test.GetClientID();

	valueList[1].valueName = "Client Name";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = nameDidPass;

	CheckResults(TestName, valueList, 2);
}

int main(void)
{
	cout << "Test Beginning" << endl;

	TestConstructor();

	return 0;
}