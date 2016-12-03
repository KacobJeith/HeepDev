#include "Client.h"

#ifdef ONPC
#include <iostream>
OutputData::OutputData(std::string inName, int destID, std::string destIP, int srcID, int val)
	: inputName(inName)
	, destinationID(destID)
	, destinationIP(destIP)
	, sourceID(srcID)
	, value(val)
{}
#else
OutputData::OutputData(String inName, int destID, String destIP, int srcID, int val)
	: inputName(inName)
	, destinationID(destID)
	, destinationIP(destIP)
	, sourceID(srcID)
	, value(val)
{}
#endif

OutputData::~OutputData()
{}

OutputDataList::OutputDataList()
	: size(0)
{

}

OutputDataList::~OutputDataList()
{

}

OutputData OutputDataList::GetOutputAt(int index)
{
	if(size != 0)
	{
		OutputDataNode* tracker = head;
		for(int i = 0; i < index; i++)
		{
			tracker = tracker->next;
		}
		return tracker->outData;
	}

	return OutputData();
}

void OutputDataList::AddOutput(OutputData outData)
{
	if(size == 0)
	{
		head = InitializeOutputList(outData);
		size++;
	}
	else
	{
		AddOutputToList(head, outData);
		size++;
	}
}

void OutputDataList::AddOutputToList(OutputDataNode* head, OutputData outData)
{
	OutputDataNode* newNode;
    
    newNode = new OutputDataNode();
   
    newNode->outData = outData;
    
    OutputDataNode* tracker = head;
    while(tracker->next){tracker = tracker->next;}
    
    tracker->next = newNode;
}

OutputDataNode* OutputDataList::InitializeOutputList(OutputData outData)
{
    OutputDataNode* head = new OutputDataNode();
    head->outData = outData;
    return head;
}

Client::Client()
	: controlValueList(0)
{

}

#ifdef ONPC
Client::Client(int ID, std::string name, int numControls)
	: clientID(ID)
	, clientName(name)
	, clientType(0)
	, clientIP("None")
	, controlValueList(numControls)
{
}

#else
Client::Client(int ID, String name, int numControls)
	: clientID(ID)
	, clientName(name)
	, clientType(0)
	, clientIP("None")
	, controlValueList(numControls)
{
}

#endif

Client::~Client()
{

}

#ifdef ONPC

std::string Client::GetClientString()
{
	std::string retString = std::to_string(clientID) + "," + clientIP + "," + std::to_string(clientType) + "," + clientName;

	for(int i = 0; i < controlValueList.GetMaxElementIndex(); i++)
	{
		retString += "," + controlValueList.GetControlAtIndex(i).GetControlString();
	}

	return retString;
}

OutputDataList Client::QueueOutput(std::string outputName, int value)
{
	OutputDataList outList;

	for(int i = 0; i < vertList.GetSize(); i++)
	{
		Vertex curVert = vertList.GetVertexAt(i);
		if(curVert.GetOutputName() == outputName)
		{
			outList.AddOutput(OutputData(curVert.GetInputName(), curVert.GetDestinationID(), curVert.GetDestinationIP(), curVert.GetSourceID(), value));
		}
	}

	return outList;
}

void Client::AddVerticesFromString(std::string vertexString)
{
	int lastIndex = 0;
	for(int i = 0; i<vertexString.size(); i++)
	{
		char curChar = vertexString[i];
		
		if(curChar == ';')
		{
			std::string singleVertex = vertexString.substr(lastIndex, i - lastIndex);
			// Vertex myVert(singleVertex);
			// AddVertexToClient(myVert);
			std::cout << singleVertex << std::endl;

			lastIndex = i+1;
		}
	}
}

#else

String Client::GetClientString()
{
	return "Test";
}


OutputDataList Client::QueueOutput(String outputName, int value)
{
	OutputDataList outList;

	for(int i = 0; i < vertList.GetSize(); i++)
	{
		Vertex curVert = vertList.GetVertexAt(i);
		if(curVert.GetOutputName() == outputName)
		{
			outList.AddOutput(OutputData(curVert.GetInputName(), curVert.GetDestinationID(), curVert.GetDestinationIP(), clientID, value));
		}
	}

	return outList;
}

void Client::AddVerticesFromString(String vertexString)
{
	
}

#endif