#include "Client.h"

char PLCOutputBuffer [PLC_OUTPUT_BUFFER_SIZE];

char NewConnectCommand [] = "NewConnect:";
char IsPLCServerCommand [] = "IsPLCServer:";

char* GetIsPLCServerCommand()
{
	ClearString(PLCOutputBuffer, PLC_OUTPUT_BUFFER_SIZE);
	CopyStringToBuffer(PLCOutputBuffer, IsPLCServerCommand);

	return PLCOutputBuffer;
}

char* GetNewConnectCommand()
{
	ClearString(PLCOutputBuffer, PLC_OUTPUT_BUFFER_SIZE);

	int stringTracker = 0;
	CopyStringToBufferAtPos(PLCOutputBuffer, NewConnectCommand, stringTracker);
	CopyStringToBufferAtPos(PLCOutputBuffer, GetClientString(), stringTracker);
	return PLCOutputBuffer;
}