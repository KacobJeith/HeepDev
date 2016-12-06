#include "../Utilities/globalDefines.h"

#ifdef ONPC
#include <string>
#endif

class Vertex {
public:

	Vertex();
#ifdef ONPC
	Vertex(std::string inputStr, std::string outputStr, std::string destIP, int destID, int srcID);
	Vertex(std::string VertexString);
#else
	Vertex(char* inputStr, char* outputStr, char* destIP, int destID, int srcID);
	Vertex(char* VertexString);

#endif
	~Vertex();

#ifdef ONPC
	std::string GetInputName()			{return inputName; };
	std::string GetOutputName()			{return outputName; };
	std::string GetDestinationIP()		{return destinationIP; };

	void	SetInputName(std::string inputStr)		{inputName = inputStr; };
	void 	SetOutputName(std::string outputStr)	{outputName = outputStr; };	
	void 	SetDestinationIP(std::string destIP)	{destinationIP = destIP; };
#else
	char* 	GetInputName()			{return inputName; };
	char* 	GetOutputName()			{return outputName; };
	char* 	GetDestinationIP()		{return destinationIP; };

	void	SetInputName(char* inputStr);
	void 	SetOutputName(char* outputStr);
	void 	SetDestinationIP(char* destIP);
#endif

	int GetDestinationID() 				{return destinationID; };
	int GetSourceID()					{return sourceID; };

	void SetDestinationID(int destID) 	{destinationID = destID; };
	void SetSourceID(int srcID)			{sourceID = srcID; };

private:
#ifdef ONPC
	std::string inputName;
	std::string outputName;
	std::string destinationIP;
#else
	char inputName [VERTEX_CONTROL_NAME_LENGTH];
	char outputName [VERTEX_CONTROL_NAME_LENGTH];
	char destinationIP [VERTEX_IP_NAME_LENGTH];
#endif
	int destinationID;
	int sourceID;
};

struct VertexNode{
	VertexNode* next;
	Vertex controlData;
};

class VertexList{
public:
	VertexList();
	~VertexList();

	void AddVertex(Vertex vert);
	Vertex GetVertexAt(int index);

	int GetSize() {return size; };

private:
	int size;
	VertexNode* head;


	void AddVertexToList(VertexNode* head, Vertex vert);
	VertexNode* InitializeVertexList(Vertex vert);
};
