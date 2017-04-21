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

void FillOutputBufferWithControlData()
{
	for(int i = 0; i < numberOfControls; i++)
	{
		AddNewCharToOutputBuffer(ControlOpCode);
		AddDeviceIDToOutputBuffer(deviceID);
		unsigned int byteSize = strlen(controlList[i].controlName) + 6;
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

void FillOutputBufferWithMemoryDump()
{
	AddNewCharToOutputBuffer(MemoryDumpOpCode);
	AddDeviceIDToOutputBuffer(deviceID);

	unsigned long totalMemory = curFilledMemory + CalculateCoreMemorySize();

	AddNewCharToOutputBuffer(totalMemory);

	// Add Client Data
	AddNewCharToOutputBuffer(ClientDataOpCode);
	AddDeviceIDToOutputBuffer(deviceID);
	AddNewCharToOutputBuffer(1);
	AddNewCharToOutputBuffer(firmwareVersion);

	FillOutputBufferWithControlData();

	// Add Dynamic Memory
	for(int i = 0; i<curFilledMemory; i++)
	{
		AddNewCharToOutputBuffer(deviceMemory[i]);
	}
}

void FillOutputBufferWithSuccess(char* message, int stringLength)
{
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
	AddNewCharToOutputBuffer(ErrorOpCode);
	AddDeviceIDToOutputBuffer(deviceID);

	unsigned long totalMemory = strlen(message);

	AddNewCharToOutputBuffer(totalMemory);

	for(int i = 0; i < totalMemory; i++)
	{
		AddNewCharToOutputBuffer(message[i]);
	}
}

unsigned int GetNumberFromBuffer(unsigned char* buffer, unsigned int &counter, unsigned char numBytes)
{
	unsigned int number = 0;

	for(int i = 0; i < numBytes; i++)
	{
		int curNum = buffer[counter+i];
		number += curNum << (8 * (numBytes-i-1));
	}

	return number;
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

	int success = SetControlValueByID(controlID, value);

	ClearOutputBuffer();
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

void ExecuteControlOpCodes()
{
	unsigned char ControlOpCode = inputBuffer[0];
	if(ControlOpCode == MemoryDumpOpCode)
	{
		ExecuteMemoryDumpOpCode();
	}
	else if(ControlOpCode == SetValueOpCode)
	{
		ExecuteSetValOpCode();
	}
}

#endif