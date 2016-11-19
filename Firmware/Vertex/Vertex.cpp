#include "Vertex.h"

VertexList::VertexList()
	: size(0)
{

}

VertexList::~VertexList()
{

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