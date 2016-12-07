#include "GlobalPreprocessor.h"

struct Vertex
{
	char inputName [CONTROL_NAME_MEMORY_SIZE];
	char outputName [CONTROL_NAME_MEMORY_SIZE];
	char destLastOctet;
	int destinationID;
	//int sourceID; // THIS IS JUST THE client ID in client.h
};
