#include "../StringUtils/StringUtils.h"
#include "GlobalPreprocessor.h"
#include "ControlValue.h"
#include "Vertex.h"

char clientName [CLIENT_NAME_MEMORY_SIZE];
int clientID;
char clientType;
ControlValue controlList [NUMBER_OF_CONTROLS];
Vertex vertexList [ALLOWED_VERTICES];

char clientString [CLIENT_STRING_MEMORY_SIZE];

void CreateClientFromParams(char* name, int ID, char type)
{
	ClearString(clientName, CLIENT_NAME_MEMORY_SIZE);
	CopyStringToBuffer(clientName, name);

	clientID = ID;
	clientType = type;
}