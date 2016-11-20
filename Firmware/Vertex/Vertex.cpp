#include "Vertex.h"

VertexList::VertexList()
	: size(0)
{

}

VertexList::~VertexList()
{

}

Vertex VertexList::GetVertexAt(int index)
{
	if(size != 0)
	{
		VertexNode* tracker = head;
		for(int i = 0; i < index; i++)
		{
			tracker = tracker->next;
		}
		return tracker->controlData;
	}

	return Vertex();
}

void VertexList::AddVertex(Vertex vert)
{
	if(size == 0)
	{
		head = InitializeVertexList(vert);
		size++;
	}
	else
	{
		AddVertexToList(head, vert);
	}
}

void VertexList::AddVertexToList(VertexNode* head, Vertex vert)
{
	VertexNode* newNode;
    
    newNode = new VertexNode();
   
    newNode->controlData = vert;
    
    VertexNode* tracker = head;
    while(tracker->next){tracker = tracker->next;}
    
    tracker->next = newNode;
}

VertexNode* VertexList::InitializeVertexList(Vertex vert)
{
    VertexNode* head = new VertexNode();
    head->controlData = vert;
    return head;
}

Vertex::Vertex()
{

}

#ifdef ONPC
Vertex::Vertex(std::string inputStr, std::string outputStr, std::string destIP, int destID, int srcID)
	: inputName(inputStr)
	, outputName(outputStr)
	, destinationIP(destIP)
	, destinationID(destID)
	, sourceID(srcID)
{

}

Vertex::Vertex(std::string VertexString)
{
	enum parseState {parseInputName, parseOutputName, parseDestIP, parseDestID};

	parseState curState = parseInputName;

	std::string inputStr, outputStr, destIPStr, destIDStr, sourceIDStr;
	int inputIndex, outputIndex, IPIndex, destIDIndex, sourceIDIndex;

	for(int i = 0; i<VertexString.size(); i++)
	{
		char curChar = VertexString[i];
		
		if(curChar == ',')
		{
			if(curState == parseInputName)
			{
				inputIndex = i;
				inputStr = VertexString.substr(0, inputIndex);
				curState = parseOutputName;
			}
			else if(curState == parseOutputName)
			{
				outputIndex = i;
				outputStr = VertexString.substr(inputIndex+1, outputIndex-(inputIndex+1));
				curState = parseDestIP;
			}
			else if(curState == parseDestIP)
			{
				IPIndex = i;
				destIPStr = VertexString.substr(outputIndex+1, IPIndex-(outputIndex+1));
				curState = parseDestID;
			}
			else if(curState == parseDestID)
			{
				destIDIndex = i;
				destIDStr = VertexString.substr(IPIndex+1, destIDIndex-(IPIndex+1));
				sourceIDStr = VertexString.substr(destIDIndex+1, VertexString.size()-(destIDIndex+1));
				break;
			}
		}
	}

	inputName = inputStr;
	outputName = outputStr;
	destinationIP = destIPStr;
	destinationID = std::stoi(destIDStr.c_str());
	sourceID = std::stoi(sourceIDStr.c_str());
}
#else
Vertex::Vertex(String inputStr, String outputStr, String destIP, int destID, int srcID)
	: inputName(inputStr)
	, outputName(outputStr)
	, destinationIP(destIP)
	, destinationID(destID)
	, sourceID(srcID)
{

}
#endif

Vertex::~Vertex()
{

}