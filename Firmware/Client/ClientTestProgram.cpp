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

void TestOutputDataConstructor()
{
	std::string TestName = "Test Output Data Constructor";

	OutputData test("TestInput", 123, "myIP", 55, 20);

	std::string correctString = "TestInput";
	int stringCorrect = 0;
	if(correctString == test.GetInputName())
	{
		stringCorrect = 1;
	}

	std::string correctString2 = "myIP";
	int stringCorrect2 = 0;
	if(correctString2 == test.GetDestinationIP())
	{
		stringCorrect2 = 1;
	}

	ExpectedValue valueList [2];

	valueList[0].valueName = "Input Name";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = stringCorrect;

	valueList[1].valueName = "Destination IP";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = stringCorrect2;

	CheckResults(TestName, valueList, 2);
}

void TestGetClientString()
{
	std::string TestName = "GetClientString";

	Client test(132, "TestClient", 2);

	test.AddControlToClient(ControlValue("Test Output", ControlValue::output, ControlValue::Range));
	test.AddControlToClient(ControlValue("Test Input", ControlValue::input, ControlValue::Range));

	std::string correctString = "132,None,0,TestClient,1,1,Test Output,0,10,0,1,Test Input,0,10";
	int stringCorrect = 0;
	if(correctString == test.GetClientString())
	{
		stringCorrect = 1;
	}

	ExpectedValue valueList [1];

	valueList[0].valueName = "Client String";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = stringCorrect;

	CheckResults(TestName, valueList, 1);
}

void TestAddVertex()
{
	std::string TestName = "Add Vertex to Client";

	Client test(132, "TestClient", 2);
	test.AddVertexToClient(Vertex("input", "output", "myIP", 12, 34));
	test.AddVertexToClient(Vertex("in", "out", "myIP", 23, 34));

	ExpectedValue valueList [2];

	valueList[0].valueName = "Vertex 0";
	valueList[0].expectedValue = 12;
	valueList[0].actualValue = test.GetVertexAtIndex(0).GetDestinationID();

	valueList[1].valueName = "Vertex 1";
	valueList[1].expectedValue = 23;
	valueList[1].actualValue = test.GetVertexAtIndex(1).GetDestinationID();

	CheckResults(TestName, valueList, 2);
}

void TestAddClientControl()
{
	std::string TestName = "Add Client Control";

	Client test(132, "TestClient", 2);

	test.AddControlToClient(ControlValue("Test Output", ControlValue::output, ControlValue::Range));
	test.AddControlToClient(ControlValue("Test Input", ControlValue::input, ControlValue::Range));

	ExpectedValue valueList [2];

	valueList[0].valueName = "Control 0";
	valueList[0].expectedValue = ControlValue::output;
	valueList[0].actualValue = test.GetControlAtIndex(0).GetControlDirection();

	valueList[1].valueName = "Control 1";
	valueList[1].expectedValue = ControlValue::input;
	valueList[1].actualValue = test.GetControlAtIndex(1).GetControlDirection();

	CheckResults(TestName, valueList, 2);
}

void TestConstructor()
{
	std::string TestName = "Client Constructor Test";

	Client test(10, "Test", 0);

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
	cout << "Client Test Beginning" << endl;

	TestConstructor();
	TestAddClientControl();
	TestGetClientString();
	TestAddVertex();
	TestOutputDataConstructor();

	return 0;
}