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
	OutputData(char* inName, int destID, char* destIP, int srcID, int val);

	char* GetInputName() 		{return inputName; };
	char* GetDestinationIP()	{return destinationIP; };
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
	char inputName [OUT_DATA_CONTROL_NAME_LENGTH];
	char destinationIP [OUT_DATA_IP_NAME_LENGTH];
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
	Client(int ID, char* name, int numControls);
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
	void AddVerticesFromString(std::string vertexString);

	std::string GetClientName() {return clientName; };
	std::string GetClientString();

	OutputDataList	QueueOutput(std::string outputName, int value);
#else
	void AddVerticesFromString(char* vertexString);

	char* 		GetClientName() {return clientName; };
	char* 		GetClientString();

	OutputDataList	QueueOutput(char* outputName, int value);
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
	char clientName [CLIENT_NAME_BUFFER_LEN];
	char clientIP [CLIENT_IP_NAME_LENGTH];
	char clientStringBuf [CLIENT_OUT_STRING_BUFFER_LEN];
#endif

};