#include "Client.h"

#ifdef ONPC
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

#else

String Client::GetClientString()
{
	return "Test";
}

#endif