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

void TestVertexListGetByIndex()
{
	std::string TestName = "Vertex List Get By Index Test";

	Vertex vert("input", "output", "myIP", 12, 34);
	Vertex vert2("dlfkj", "fork", "myArp", 22, 224);
	Vertex vert3("Forage", "Flaunt", "MyArgh", 32, 123);

	VertexList theList;
	theList.AddVertex(vert);
	theList.AddVertex(vert2);
	theList.AddVertex(vert3);

	Vertex receivedVert = theList.GetVertexAt(0);
	Vertex receivedVert2 = theList.GetVertexAt(1);
	Vertex receivedVert3 = theList.GetVertexAt(2);

	ExpectedValue valueList [3];
	valueList[0].valueName = "vert1 sourceID";
	valueList[0].expectedValue = 34;
	valueList[0].actualValue = receivedVert.GetSourceID();

	valueList[1].valueName = "vert2 sourceID";
	valueList[1].expectedValue = 224;
	valueList[1].actualValue = receivedVert2.GetSourceID();

	valueList[2].valueName = "vert3 sourceID";
	valueList[2].expectedValue = 123;
	valueList[2].actualValue = receivedVert3.GetSourceID();

	CheckResults(TestName, valueList, 3);
}

void TestVertexListSize()
{
	std::string TestName = "Vertex List Size Test";

	Vertex vert("input", "output", "myIP", 12, 34);
	Vertex vert2("dlfkj", "fork", "myArp", 22, 224);

	VertexList theList;
	theList.AddVertex(vert);
	theList.AddVertex(vert2);

	ExpectedValue valueList [1];
	valueList[0].valueName = "List Size";
	valueList[0].expectedValue = 2;
	valueList[0].actualValue = theList.GetSize();

	CheckResults(TestName, valueList, 1);
}

void TestVertexByString()
{
	std::string TestName = "Vertex By String Test";

	Vertex vert("input,output,myIP,12,34");

	std::string expectedInput = "input";
	std::string actualInput = vert.GetInputName();
	int isInputNameCorrect = 0;
	if(expectedInput == actualInput)
		isInputNameCorrect = 1;

	std::string expectedOutput = "output";
	std::string actualOutput = vert.GetOutputName();
	int isOutputNameCorrect = 0;
	if(expectedOutput == actualOutput)
		isOutputNameCorrect = 1;

	std::string expectedIP = "myIP";
	std::string actualIP = vert.GetDestinationIP();
	int isIPCorrect = 0;
	if(expectedIP == actualIP)
		isIPCorrect = 1;

	ExpectedValue valueList [5];
	valueList[0].valueName = "Input Name";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = isInputNameCorrect;

	valueList[1].valueName = "Output Name";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = isOutputNameCorrect;

	valueList[2].valueName = "Destination IP";
	valueList[2].expectedValue = 1;
	valueList[2].actualValue = isIPCorrect;

	valueList[3].valueName = "Destination ID";
	valueList[3].expectedValue = 12;
	valueList[3].actualValue = vert.GetDestinationID();

	valueList[4].valueName = "Source ID";
	valueList[4].expectedValue = 34;
	valueList[4].actualValue = vert.GetSourceID();

	CheckResults(TestName, valueList, 5);
}

void TestConstructor()
{
	std::string TestName = "Vertex Constructor Test";

	Vertex vert("input", "output", "myIP", 12, 34);

	 std::string expectedInput = "input";
	 std::string actualInput = vert.GetInputName();
	 int isInputNameCorrect = 0;
	 if(expectedInput == actualInput)
	 	isInputNameCorrect = 1;

	 std::string expectedOutput = "output";
	 std::string actualOutput = vert.GetOutputName();
	 int isOutputNameCorrect = 0;
	 if(expectedOutput == actualOutput)
	 	isOutputNameCorrect = 1;

	 std::string expectedIP = "myIP";
	 std::string actualIP = vert.GetDestinationIP();
	 int isIPCorrect = 0;
	 if(expectedIP == actualIP)
	 	isIPCorrect = 1;

	ExpectedValue valueList [5];
	valueList[0].valueName = "Input Name";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = isInputNameCorrect;

	valueList[1].valueName = "Output Name";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = isOutputNameCorrect;

	valueList[2].valueName = "Destination IP";
	valueList[2].expectedValue = 1;
	valueList[2].actualValue = isIPCorrect;

	valueList[3].valueName = "Destination ID";
	valueList[3].expectedValue = 12;
	valueList[3].actualValue = vert.GetDestinationID();

	valueList[4].valueName = "Source ID";
	valueList[4].expectedValue = 34;
	valueList[4].actualValue = vert.GetSourceID();

	CheckResults(TestName, valueList, 5);
}

int main(void)
{
	cout << "Vertex Test Beginning" << endl;
	TestConstructor();
	TestVertexListSize();
	TestVertexListGetByIndex();
	TestVertexByString();

	return 0;
}