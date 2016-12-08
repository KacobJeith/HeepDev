#ifndef VERTEX_DEF
#define VERTEX_DEF

#include "GlobalPreprocessor.h"

struct Vertex
{
	char inputName [CONTROL_NAME_MEMORY_SIZE];
	char outputName [CONTROL_NAME_MEMORY_SIZE];
	char destIP [IP_ADDRESS_LENGTH];
	int destinationID;
	//int sourceID; // THIS IS JUST THE client ID in client.h

	// Memory efficient implementation of Output List
	char shouldOutput;
	char value;
};

Vertex* CreateVertex(char* inputName, char* outputName, char* destIP, int destinationID)
{
	Vertex* newVertex = new Vertex();

	ClearString(newVertex->inputName, CONTROL_NAME_MEMORY_SIZE);
	CopyStringToBuffer(newVertex->inputName, inputName);

	ClearString(newVertex->outputName, CONTROL_NAME_MEMORY_SIZE);
	CopyStringToBuffer(newVertex->outputName, outputName);
	
	ClearString(newVertex->destIP, IP_ADDRESS_LENGTH);
	CopyStringToBuffer(newVertex->destIP, destIP);

	newVertex->destinationID = destinationID;

	return newVertex;
}

Vertex* CreateVertexFromString(char* vertexString)
{
	Vertex* newVertex = new Vertex();

	enum ParseStates {parseInputName
					, parseOutputName
					, parseDestIP
					, parseDestID
					};

	ParseStates curState = parseInputName;

	char stringTracker = 0;
	char lastCommaPos = 0;

	while(1)
	{
		if(vertexString[stringTracker] == ',')
		{
			if(curState == parseInputName)
			{
				ClearString(newVertex->inputName, CONTROL_NAME_MEMORY_SIZE);
				CopySubstringToBuffer(newVertex->inputName, vertexString, 0, stringTracker);
				lastCommaPos = stringTracker;
				curState = parseOutputName;
			}
			else if(curState == parseOutputName)
			{
				ClearString(newVertex->outputName, CONTROL_NAME_MEMORY_SIZE);
				CopySubstringToBuffer(newVertex->outputName, vertexString, lastCommaPos+1, stringTracker);
				lastCommaPos = stringTracker;
				curState = parseDestIP;
			}
			else if(curState == parseDestIP)
			{
				ClearString(newVertex->destIP, IP_ADDRESS_LENGTH);
				CopySubstringToBuffer(newVertex->destIP, vertexString, lastCommaPos+1, stringTracker);
				lastCommaPos = stringTracker;
				curState = parseDestID;
			}
			else if(curState == parseDestID)
			{
				newVertex->destinationID = ParseIntFromSubString(vertexString, lastCommaPos+1, stringTracker);
				break;
			}
			// We don't need to parse the src ID
		}
		stringTracker++;
	}

	return newVertex;
}

#endif