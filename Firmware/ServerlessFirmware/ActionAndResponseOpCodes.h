#ifndef ACTION_RESPONSE_OP_CODES_H
#define ACTION_RESPONSE_OP_CODES_H

#include "Device.h"

unsigned char outputBuffer [OUTPUT_BUFFER_SIZE];
unsigned long outputBufferLastByte = 0;

unsigned char inputBuffer [INPUT_BUFFER_SIZE];
unsigned long inputBufferLastByte = 0;

void ClearOutputBuffer()
{
	outputBufferLastByte = 0;
}

void ClearInputBuffer()
{
	inputBufferLastByte = 0;
}

void AddNewCharToOutputBuffer(unsigned char newMem)
{
	outputBufferLastByte = AddCharToBuffer(outputBuffer, outputBufferLastByte, newMem);
}

void AddDeviceIDToOutputBuffer(unsigned long deviceID)
{
	outputBufferLastByte = AddDeviceIDToBuffer(outputBuffer, outputBufferLastByte, deviceID);
}

unsigned long CalculateControlDataSize()
{
	unsigned long controlDataSize = 0;

	for(int i = 0; i < numberOfControls; i++)
	{
		controlDataSize += 12;
		controlDataSize += strlen(controlList[i].controlName);
	}

	return controlDataSize;
}

unsigned long CalculateCoreMemorySize()
{
	unsigned long coreMemorySize = 0;

	// Firmware Version / Initial Client ID will always be the same
	coreMemorySize += 7;

	return coreMemorySize + CalculateControlDataSize();
}

void FillOutputBufferWithSetValCOP(unsigned char controlID, unsigned char value)
{
	ClearOutputBuffer();
	AddNewCharToOutputBuffer(SetValueOpCode);
	AddNewCharToOutputBuffer(2);
	AddNewCharToOutputBuffer(controlID);
	AddNewCharToOutputBuffer(value);
}

void FillOutputBufferWithControlData()
{
	for(int i = 0; i < numberOfControls; i++)
	{
		AddNewCharToOutputBuffer(ControlOpCode);
		AddDeviceIDToOutputBuffer(deviceID);
		unsigned int byteSize = strlen(controlList[i].controlName) + 6;
		AddNewCharToOutputBuffer(byteSize);
		AddNewCharToOutputBuffer(controlList[i].controlID);
		AddNewCharToOutputBuffer(controlList[i].controlType);
		AddNewCharToOutputBuffer(controlList[i].controlDirection);
		AddNewCharToOutputBuffer(controlList[i].lowValue);
		AddNewCharToOutputBuffer(controlList[i].highValue);
		AddNewCharToOutputBuffer(controlList[i].curValue);

		for(int j = 0; j < strlen(controlList[i].controlName); j++)
		{
			AddNewCharToOutputBuffer(controlList[i].controlName[j]);
		}
	}
}

void FillOutputBUfferWithDynamicMemorySize()
{
	AddNewCharToOutputBuffer(DynamicMemorySizeOpCode);
	AddDeviceIDToOutputBuffer(deviceID);
	AddNewCharToOutputBuffer(1);
	AddNewCharToOutputBuffer(MAX_MEMORY);
}

void FillOutputBufferWithMemoryDump()
{
	ClearOutputBuffer();
	
	AddNewCharToOutputBuffer(MemoryDumpOpCode);
	AddDeviceIDToOutputBuffer(deviceID);

	unsigned long totalMemory = curFilledMemory + CalculateCoreMemorySize();

	AddNewCharToOutputBuffer(totalMemory);

	// Add Client Data
	AddNewCharToOutputBuffer(ClientDataOpCode);
	AddDeviceIDToOutputBuffer(deviceID);
	AddNewCharToOutputBuffer(1);
	AddNewCharToOutputBuffer(firmwareVersion);

	// Add Control Data
	FillOutputBufferWithControlData();

	// Add Dynamic Memory Size
	FillOutputBUfferWithDynamicMemorySize();

	// Add Dynamic Memory
	for(int i = 0; i<curFilledMemory; i++)
	{
		AddNewCharToOutputBuffer(deviceMemory[i]);
	}
}

void FillOutputBufferWithSuccess(char* message, int stringLength)
{
	ClearOutputBuffer();

	AddNewCharToOutputBuffer(SuccessOpCode);
	AddDeviceIDToOutputBuffer(deviceID);

	unsigned long totalMemory = strlen(message);

	AddNewCharToOutputBuffer(totalMemory);

	for(int i = 0; i < totalMemory; i++)
	{
		AddNewCharToOutputBuffer(message[i]);
	}
}

void FillOutputBufferWithError(char* message, int stringLength)
{
	ClearOutputBuffer();

	AddNewCharToOutputBuffer(ErrorOpCode);
	AddDeviceIDToOutputBuffer(deviceID);

	unsigned long totalMemory = strlen(message);

	AddNewCharToOutputBuffer(totalMemory);

	for(int i = 0; i < totalMemory; i++)
	{
		AddNewCharToOutputBuffer(message[i]);
	}
}

void ExecuteMemoryDumpOpCode()
{
	FillOutputBufferWithMemoryDump();
}

void ExecuteSetValOpCode()
{
	unsigned int counter = 1;
	unsigned char numBytes = inputBuffer[counter++];
	unsigned char controlID = inputBuffer[counter++];
	unsigned int value = GetNumberFromBuffer(inputBuffer, counter, numBytes - 1);

	int success = SetControlValueByIDFromNetwork(controlID, value);

	if(success == 0)
	{
		char SuccessMessage [] = "Value Set";
		FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
	}
	else 
	{
		char ErrorMessage [] = "Failed to Set";
		FillOutputBufferWithError(ErrorMessage, strlen(ErrorMessage));
	}
}

void ExecuteSetPositionOpCode()
{
	unsigned int counter = 1;
	unsigned char numBytes = inputBuffer[counter++];
	unsigned int xValue = GetNumberFromBuffer(inputBuffer, counter, 2);
	unsigned int yValue = GetNumberFromBuffer(inputBuffer, counter, 2);

	UpdateXYInMemory(xValue, yValue, deviceID);

	char SuccessMessage [] = "Value Set";
	FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
}

void ExecuteSetVertexOpCode()
{
	unsigned int counter = 1;
	unsigned char numBytes = GetNumberFromBuffer(inputBuffer, counter, 1);
	unsigned long txID = GetNumberFromBuffer(inputBuffer, counter, 4);
	unsigned long rxID = GetNumberFromBuffer(inputBuffer, counter, 4);
	unsigned char txControl = GetNumberFromBuffer(inputBuffer, counter, 1);
	unsigned char rxControl = GetNumberFromBuffer(inputBuffer, counter, 1);
	HeepIPAddress vertexIP;
	vertexIP.Octet4 = GetNumberFromBuffer(inputBuffer, counter, 1);
	vertexIP.Octet3 = GetNumberFromBuffer(inputBuffer, counter, 1);
	vertexIP.Octet2 = GetNumberFromBuffer(inputBuffer, counter, 1);
	vertexIP.Octet1 = GetNumberFromBuffer(inputBuffer, counter, 1);

	Vertex myVertex;
	myVertex.rxID = rxID;
	myVertex.txID = txID;
	myVertex.rxControlID = rxControl;
	myVertex.txControlID = txControl;
	myVertex.rxIPAddress = vertexIP;

	AddVertex(myVertex);

	ClearOutputBuffer();
	char SuccessMessage [] = "Vertex Set";
	FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
}

void ExecuteDeleteVertexOpCode()
{
	unsigned int counter = 1;

	unsigned char numBytes = GetNumberFromBuffer(inputBuffer, counter, 1);
	unsigned long txID = GetNumberFromBuffer(inputBuffer, counter, 4);
	unsigned long rxID = GetNumberFromBuffer(inputBuffer, counter, 4);
	unsigned char txControl = GetNumberFromBuffer(inputBuffer, counter, 1);
	unsigned char rxControl = GetNumberFromBuffer(inputBuffer, counter, 1);
	HeepIPAddress vertexIP;
	vertexIP.Octet4 = GetNumberFromBuffer(inputBuffer, counter, 1);
	vertexIP.Octet3 = GetNumberFromBuffer(inputBuffer, counter, 1);
	vertexIP.Octet2 = GetNumberFromBuffer(inputBuffer, counter, 1);
	vertexIP.Octet1 = GetNumberFromBuffer(inputBuffer, counter, 1);

	Vertex myVertex;
	myVertex.rxID = rxID;
	myVertex.txID = txID;
	myVertex.rxControlID = rxControl;
	myVertex.txControlID = txControl;
	myVertex.rxIPAddress = vertexIP;

	if(DeleteVertex(myVertex) == 1)
	{
		ClearOutputBuffer();
		char errorMessage [] = "Failed to delete Vertex!";
		FillOutputBufferWithError(errorMessage, strlen(errorMessage));
	}
	else
	{
		ClearOutputBuffer();
		char SuccessMessage [] = "Vertex Deleted!";
		FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
	}
}

void ExecuteAddMOPOpCode()
{
	unsigned int counter = 1;

	unsigned char numBytes = GetNumberFromBuffer(inputBuffer, counter, 1);

	for(int i = 0; i < numBytes; i++)
	{
		AddNewCharToMemory(inputBuffer[counter]);
		counter++;
	}

	ClearOutputBuffer();
	char SuccessMessage [] = "MOP Added!";
	FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
}

void ExecuteControlOpCodes()
{
	unsigned char ControlOpCode = inputBuffer[0];
	if(ControlOpCode == IsHeepDeviceOpCode)
	{
		ExecuteMemoryDumpOpCode();
	}
	else if(ControlOpCode == SetValueOpCode)
	{
		ExecuteSetValOpCode();
	}
	else if(ControlOpCode == SetPositionOpCode)
	{
		ExecuteSetPositionOpCode();
	}
	else if(ControlOpCode == SetVertexOpCode)
	{
		ExecuteSetVertexOpCode();
	}
	else if(ControlOpCode == DeleteVertexOpCode)
	{
		ExecuteDeleteVertexOpCode();
	}
	else if(ControlOpCode == AddMOPOpCode)
	{
		ExecuteAddMOPOpCode();
	}
}

#endif