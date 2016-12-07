#include "GlobalPreprocessor.h"

struct Vertex
{
	char inputName [CONTROL_NAME_MEMORY_SIZE];
	char outputName [CONTROL_NAME_MEMORY_SIZE];
	char destLastOctet;
	int destinationID;
	//int sourceID; // THIS IS JUST THE client ID in client.h

	// Memory efficient implementation of Output List
	char shouldOutput;
	char value;
};

Vertex* CreateVertex(char* inputName, char* outputName, char destLastOctet, int destinationID)
{
	Vertex* newVertex = new Vertex();

	ClearString(newVertex->inputName, CONTROL_NAME_MEMORY_SIZE);
	CopyStringToBuffer(newVertex->inputName, inputName);

	ClearString(newVertex->outputName, CONTROL_NAME_MEMORY_SIZE);
	CopyStringToBuffer(newVertex->outputName, outputName);
	
	newVertex->destLastOctet = destLastOctet;
	newVertex->destinationID = destinationID;

	return newVertex;
}