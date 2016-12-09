#ifndef CLIENT_API_DEF
#define CLIENT_API_DEF

#include "Client.h"

char PLCOutputBuffer [PLC_OUTPUT_BUFFER_SIZE];
char PLCInputBuffer [PLC_INPUT_BUFFER_SIZE];

char* GetIsPLCServerCommand()
{
	char IsPLCServerCommand [] = "IsPLCServer:";
	ClearString(PLCOutputBuffer, PLC_OUTPUT_BUFFER_SIZE);
	CopyStringToBuffer(PLCOutputBuffer, IsPLCServerCommand);

	return PLCOutputBuffer;
}

char* GetNewConnectCommand()
{
	char NewConnectCommand [] = "NewConnect:";
	ClearString(PLCOutputBuffer, PLC_OUTPUT_BUFFER_SIZE);

	int stringTracker = 0;
	CopyStringToBufferAtPos(PLCOutputBuffer, NewConnectCommand, stringTracker);
	CopyStringToBufferAtPos(PLCOutputBuffer, GetClientString(), stringTracker);
	return PLCOutputBuffer;
}

void SendOutput(char* outputName, char value)
{
	QueueClientOutput(outputName, value);

	char InterruptCommand [] = "SetVal:";

	for(int i = 0; i < numVerticesAdded; i++)
	{
		if(vertexList[i]->shouldOutput)
		{
			int stringTracker = 0;
			ClearString(PLCOutputBuffer, PLC_OUTPUT_BUFFER_SIZE);
			CopyStringToBufferAtPos(PLCOutputBuffer, InterruptCommand, stringTracker);
			CopyStringToBufferAtPos(PLCOutputBuffer, vertexList[i]->inputName, stringTracker);
			PLCOutputBuffer[stringTracker] = ','; stringTracker++;
			WriteIntToString(vertexList[i]->value, PLCOutputBuffer, stringTracker);

			// SEND TO IP in VERTEX
		}
	}
}

#endif