#include "../Utilities/GlobalDefines.h"
#include "../ControlValue/ControlValue.h"
#include "../Vertex/Vertex.h"

#ifdef ONPC
#include <string>
#endif

class OutputData{
public:
	OutputData() {};
#ifdef ONPC
	OutputData(std::string inName, int destID, std::string destIP, int srcID, int val);

	std::string GetInputName()		{return inputName; };
	std::string GetDestinationIP()	{return destinationIP; };
#else 
	OutputData(String inName, int destID, String destIP, int srcID, int val);

	String GetInputName() 		{return inputName; };
	String GetDestinationIP()	{return destinationIP; };
#endif

	~OutputData();

	int GetDestinationID()	{return destinationID; };
	int GetSourceID()		{return sourceID; };
	int GetValue()			{return value; };

private:

#ifdef ONPC
	std::string inputName;
	std::string destinationIP;
#else
	String inputName;
	String destinationIP;
#endif
	int destinationID;
	int sourceID;
	int value;
};

struct OutputDataNode{
	OutputDataNode* next;
	OutputData outData;
};

class OutputDataList{
public:
	OutputDataList();
	~OutputDataList();

	void AddOutput(OutputData vert);
	OutputData GetOutputAt(int index);

	int GetSize() {return size; };

private:
	int size;
	OutputDataNode* head;

	void AddOutputToList(OutputDataNode* head, OutputData vert);
	OutputDataNode* InitializeOutputList(OutputData vert);
};

class Client {
public:
	Client();

#ifdef ONPC
	Client(int ID, std::string name, int numControls);
#else
	Client(int ID, String name, int numControls)
#endif
	~Client();	

	// Setters
	void 			AddControlToClient(ControlValue ctrlVal) {controlValueList.AddControlValToList(ctrlVal);};
	void			AddVertexToClient(Vertex vert)	{vertList.AddVertex(vert); };

	// Getters
	int 			GetClientID() 					{return clientID; };
	ControlValue 	GetControlAtIndex(int index) 	{return controlValueList.GetControlAtIndex(index); };
	Vertex 			GetVertexAtIndex(int index)		{return vertList.GetVertexAt(index); };

#ifdef ONPC
	std::string GetClientName() {return clientName; };
	std::string GetClientString();
#else
	String 		GetClientName() {return clientName; };
	String 		GetClientString();
#endif

private:
	int clientID;
	int clientType;
	ControlValList controlValueList;
	VertexList vertList;

#ifdef ONPC
	std::string clientName;
	std::string clientIP;
#else
	String clientName;
	String clientIP;
#endif

};