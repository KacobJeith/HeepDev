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
	Vertex(String inputStr, String outputStr, String destIP, int destID, int srcID);
	Vertex(String VertexString);

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
	String 		GetInputName()			{return inputName; };
	String 		GetOutputName()			{return outputName; };
	String 		GetDestinationIP()		{return destinationIP; };

	void	SetInputName(String inputStr)		{inputName = inputStr; };
	void 	SetOutputName(String outputStr)		{outputName = outputStr; };	
	void 	SetDestinationIP(String destIP)		{destinationIP = destIP; };
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
	String inputName;
	String outputName;
	String destinationIP;
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

	void AddVertexToList(VertexNode* head, Vertex vert);
	VertexNode* InitializeVertexList(Vertex vert);

	int GetSize() {return size; };

private:
	int size;
};
