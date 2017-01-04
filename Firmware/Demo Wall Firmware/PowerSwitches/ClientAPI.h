#ifndef CLIENT_API_DEF
#define CLIENT_API_DEF

#include "Client.h"

#define ENC

#ifdef ENC
#include "PLCENC28J60Connection.h"
#else
#include "SimulationConnection.h"
#endif

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

char* GetClientVertexCommand()
{
	char GetVertexCommand [] = "GetClientVertices:";

	ClearString(PLCOutputBuffer, PLC_OUTPUT_BUFFER_SIZE);
	int stringTracker = 0;
	CopyStringToBufferAtPos(PLCOutputBuffer, GetVertexCommand, stringTracker);
	WriteIntToString(clientID, PLCOutputBuffer, stringTracker);

	return PLCOutputBuffer;
}

void SendNewConnect()
{
	GetNewConnectCommand();
	SendDataToPLCServer(PLCOutputBuffer, PLCInputBuffer);
}

void SendGetClientVertices()
{
	ClearString(PLCInputBuffer, PLC_INPUT_BUFFER_SIZE);
	GetClientVertexCommand();
	SendDataToPLCServer(PLCOutputBuffer, PLCInputBuffer);
	Serial.println(PLCInputBuffer);
	AddVerticesFromString(PLCInputBuffer);
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

			Serial.println(PLCOutputBuffer);

			SendDataToPLCClient(PLCOutputBuffer, PLCInputBuffer, vertexList[i]->destIP);
			vertexList[i]->shouldOutput = 0;
		}
	}
}

void CheckInterrupts()
{
	ClearString(PLCInputBuffer, PLC_INPUT_BUFFER_SIZE);
	CheckServerForInputs(PLCInputBuffer);

	int buffSize = GetStringLength(PLCInputBuffer);

	if(buffSize > 0)
	{

			char tempControlName [CONTROL_NAME_MEMORY_SIZE];
		ClearString(tempControlName, CONTROL_NAME_MEMORY_SIZE);

		enum InterruptStates {findColon, findName, findValue};

		InterruptStates curState = findColon;
		
		int colonLocation = 0;
		int commaLocation = 0;
		for(int i = 0; i < buffSize; i++)
		{
			if(PLCInputBuffer[i] == ':' && curState == findColon)
			{
				colonLocation = i;
				curState = findName;
			}
			else if(PLCInputBuffer[i] == ',' && curState == findName)
			{
				commaLocation = i;
				curState = findValue;
				CopySubstringToBuffer(tempControlName, PLCInputBuffer, colonLocation+1, i);
				break;
			}
		}

		int ctrlVal = ParseIntFromSubString(PLCInputBuffer, commaLocation+1, buffSize);

		for(int i = 0; i < numControlsAdded; i++)
		{
			if(CheckStringEquality(tempControlName, controlList[i]->controlName))
			{
				controlList[i]->curVal = ctrlVal;
			}
		}

	}
	
}

#endif