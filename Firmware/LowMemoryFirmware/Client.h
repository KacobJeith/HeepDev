#include "../StringUtils/StringUtils.h"
#include "GlobalPreprocessor.h"
#include "ControlValue.h"
#include "Vertex.h"

char clientName [CLIENT_NAME_MEMORY_SIZE];
int clientID;
char clientType;

char numControlsAdded;
char numVerticesAdded;

char gateWayOctet1;
char gateWayOctet2;
char gateWayOctet3;

ControlValue* controlList [NUMBER_OF_CONTROLS];
Vertex* vertexList [ALLOWED_VERTICES];

char clientString [CLIENT_STRING_MEMORY_SIZE];

void CreateClientFromParams(char* name, int ID, char type)
{
	ClearString(clientName, CLIENT_NAME_MEMORY_SIZE);
	CopyStringToBuffer(clientName, name);

	clientID = ID;
	clientType = type;

	numControlsAdded = 0;
	numVerticesAdded = 0;
}

char* GetClientName()
{
	return clientName;
}

void AddControlToList(ControlValue* myCtrl)
{
	controlList[numControlsAdded] = myCtrl;
	numControlsAdded++;
}

void AddVertex(Vertex* myVertex)
{
	vertexList[numVerticesAdded] = myVertex;
	numVerticesAdded++;
}

char* GetClientString()
{
	int stringTracker = 0;
	ClearString(clientString, CLIENT_STRING_MEMORY_SIZE);

	WriteIntToString(clientID, clientString, stringTracker);
	clientString[stringTracker] = ','; stringTracker++;
	clientString[stringTracker] = '0'; stringTracker++;
	clientString[stringTracker] = ','; stringTracker++;
	WriteIntToString(clientType, clientString, stringTracker);
	clientString[stringTracker] = ','; stringTracker++;
	CopyStringToBufferAtPos(clientString, clientName, stringTracker);

	for(int i = 0; i < numControlsAdded; i++)
	{
		clientString[stringTracker] = ','; stringTracker++;
		WriteIntToString(controlList[i]->direction, clientString, stringTracker);
		clientString[stringTracker] = ','; stringTracker++;
		WriteIntToString(controlList[i]->type, clientString, stringTracker);
		clientString[stringTracker] = ','; stringTracker++;
		CopyStringToBufferAtPos(clientString, controlList[i]->controlName, stringTracker);
		clientString[stringTracker] = ','; stringTracker++;
		WriteIntToString(controlList[i]->lowLim, clientString, stringTracker);
		clientString[stringTracker] = ','; stringTracker++;
		WriteIntToString(controlList[i]->highLim, clientString, stringTracker);
	}

	return clientString;
}