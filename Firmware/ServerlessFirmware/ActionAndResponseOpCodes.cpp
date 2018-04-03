#include "ActionAndResponseOpCodes.h"
#include <string.h>
#include "MemoryUtilities.h"
#include "DeviceMemory.h"
#include "Device.h"
#include "Heep_API.h"
#include "DeviceSpecificMemory.h"

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

void AddDeviceIDToOutputBuffer_Byte(heepByte* deviceID)
{
	outputBufferLastByte = AddDeviceIDToBuffer_Byte(outputBuffer, deviceID, outputBufferLastByte);
}

void AddDeviceIDOrIndexToOutputBuffer_Byte(heepByte* deviceID)
{
	unsigned int counter = 0;
	heepByte copyDeviceID [STANDARD_ID_SIZE];
	CopyDeviceID(deviceID, copyDeviceID);
	GetIndexedDeviceID_Byte(copyDeviceID);
	AddBufferToBuffer(outputBuffer, copyDeviceID, ID_SIZE, &outputBufferLastByte, &counter);
}

#ifdef USE_ANALYTICS
void AddAnalyticsStringToOutputBufferAndDeleteMOPs()
{
  ClearOutputBuffer();
  int AnalyticsPointer = 0;
  do
  {
      AnalyticsPointer = GetNextAnalyticsDataPointer(AnalyticsPointer);

      if(AnalyticsPointer >= 0)
      {
        int numBytes = deviceMemory[AnalyticsPointer + ID_SIZE + 1];

        AddNewCharToOutputBuffer(deviceMemory[AnalyticsPointer]);
        AddDeviceIDToOutputBuffer_Byte(deviceIDByte);
        
        for(int i = AnalyticsPointer + ID_SIZE + 1; i < AnalyticsPointer + numBytes + ID_SIZE + 2; i++)
        {
          AddNewCharToOutputBuffer(deviceMemory[i]);
        }

        deviceMemory[AnalyticsPointer] = FragmentOpCode;
      }

  }while(AnalyticsPointer != -1);
}
#endif

unsigned long CalculateControlDataSize()
{
	unsigned long controlDataSize = 0;

	int i;
	for(i = 0; i < numberOfControls; i++)
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

void FillOutputBufferWithSetValCOPBuffer(unsigned char controlID, heepByte* buffer, int bufferLength)
{
	ClearOutputBuffer();
	AddNewCharToOutputBuffer(SetValueOpCode);
	AddNewCharToOutputBuffer(bufferLength + 1);
	AddNewCharToOutputBuffer(controlID);

	int i;
	for(i = 0; i < bufferLength; i++)
	{
		AddNewCharToOutputBuffer(buffer[i]);
	}
}

// Updated
void FillOutputBufferWithControlData()
{
	int i;
	for(i = 0; i < numberOfControls; i++)
	{
		AddNewCharToOutputBuffer(ControlOpCode);
		AddDeviceIDOrIndexToOutputBuffer_Byte(deviceIDByte);
		unsigned int byteSize = strlen(controlList[i].controlName) + 6;
		AddNewCharToOutputBuffer(byteSize);
		AddNewCharToOutputBuffer(controlList[i].controlID);
		AddNewCharToOutputBuffer(controlList[i].controlType);
		AddNewCharToOutputBuffer(controlList[i].controlDirection);
		AddNewCharToOutputBuffer(controlList[i].lowValue);
		AddNewCharToOutputBuffer(controlList[i].highValue);
		AddNewCharToOutputBuffer(controlList[i].curValue);

		int j;
		for(j = 0; j < strlen(controlList[i].controlName); j++)
		{
			AddNewCharToOutputBuffer(controlList[i].controlName[j]);
		}
	}
}

// Updated
void FillOutputBufferWithDynamicMemorySize()
{
	AddNewCharToOutputBuffer(DynamicMemorySizeOpCode);
	AddDeviceIDOrIndexToOutputBuffer_Byte(deviceIDByte);
	AddNewCharToOutputBuffer(1);
	AddNewCharToOutputBuffer(MAX_MEMORY);
}

// Updated
void FillOutputBufferWithMemoryDump()
{
	ClearOutputBuffer();
	
	AddNewCharToOutputBuffer(MemoryDumpOpCode);
	AddDeviceIDToOutputBuffer_Byte(deviceIDByte);

	unsigned long totalMemory = curFilledMemory + CalculateCoreMemorySize() + 1;

	AddNewCharToOutputBuffer(totalMemory);

	// First data sent is control register so that receiver can decode the rest
	//AddNewCharToOutputBuffer(controlRegister);

	// Add Client Data
	AddNewCharToOutputBuffer(ClientDataOpCode);
	AddDeviceIDOrIndexToOutputBuffer_Byte(deviceIDByte);
	AddNewCharToOutputBuffer(1);
	AddNewCharToOutputBuffer(firmwareVersion);

	// Add Control Data
	FillOutputBufferWithControlData();

	// Add Dynamic Memory Size
	FillOutputBufferWithDynamicMemorySize();

	// Add Dynamic Memory
	int i;
	for(i = 0; i<curFilledMemory; i++)
	{
		AddNewCharToOutputBuffer(deviceMemory[i]);
	}
}

// Updated
void FillOutputBufferWithSuccess(char* message, int stringLength)
{
	ClearOutputBuffer();

	AddNewCharToOutputBuffer(SuccessOpCode);
	AddDeviceIDToOutputBuffer_Byte(deviceIDByte);

	unsigned long totalMemory = strlen(message);

	AddNewCharToOutputBuffer(totalMemory);

	int i;
	for(i = 0; i < totalMemory; i++)
	{
		AddNewCharToOutputBuffer(message[i]);
	}
}

// Updated
void FillOutputBufferWithError(char* message, int stringLength)
{
	ClearOutputBuffer();

	AddNewCharToOutputBuffer(ErrorOpCode);
	AddDeviceIDToOutputBuffer_Byte(deviceIDByte);

	unsigned long totalMemory = strlen(message);

	AddNewCharToOutputBuffer(totalMemory);

	int i;
	for(i = 0; i < totalMemory; i++)
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

	heepByte controlType = GetControlTypeFromControlID(controlID);

	int success = 1;
	if(controlType == 2)
	{
		success = SetControlValueByIDFromNetworkBuffer(controlID, inputBuffer, counter, numBytes - 1);
	}
	else
	{
		unsigned int value = GetNumberFromBuffer(inputBuffer, &counter, numBytes - 1);
		success = SetControlValueByIDFromNetwork(controlID, value);
	}

	

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

// Updatded
void ExecuteSetPositionOpCode()
{
	unsigned int counter = 1;
	unsigned char numBytes = inputBuffer[counter++];
	unsigned int xValue = GetNumberFromBuffer(inputBuffer, &counter, 2);
	unsigned int yValue = GetNumberFromBuffer(inputBuffer, &counter, 2);

	if(UpdateXYInMemory_Byte(xValue, yValue, deviceIDByte) == 0)
	{
		char SuccessMessage [] = "Value Set";
		FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
	}
	else
	{
		char ErrorMessage [] = "Failed to set. Memory Full";
		FillOutputBufferWithError(ErrorMessage, strlen(ErrorMessage));
	}
}

// Updated
void ExecuteSetVertexOpCode()
{
	struct Vertex_Byte myVertex;

	unsigned int localCounter = 0;
	unsigned int counter = 1;
	unsigned char numBytes = GetNumberFromBuffer(inputBuffer, &counter, 1);
	AddBufferToBuffer(myVertex.txID, inputBuffer, STANDARD_ID_SIZE, &localCounter, &counter);
	localCounter = 0;
	AddBufferToBuffer(myVertex.rxID, inputBuffer, STANDARD_ID_SIZE, &localCounter, &counter);
	unsigned char txControl = GetNumberFromBuffer(inputBuffer, &counter, 1);
	unsigned char rxControl = GetNumberFromBuffer(inputBuffer, &counter, 1);

	struct HeepIPAddress vertexIP;
	vertexIP.Octet4 = GetNumberFromBuffer(inputBuffer, &counter, 1);
	vertexIP.Octet3 = GetNumberFromBuffer(inputBuffer, &counter, 1);
	vertexIP.Octet2 = GetNumberFromBuffer(inputBuffer, &counter, 1);
	vertexIP.Octet1 = GetNumberFromBuffer(inputBuffer, &counter, 1);
	myVertex.rxControlID = rxControl;
	myVertex.txControlID = txControl;
	myVertex.rxIPAddress = vertexIP;

	if(AddVertex(myVertex) == 0)
	{
		ClearOutputBuffer();
		char SuccessMessage [] = "Vertex Set";
		FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
	}
	else
	{
		ClearOutputBuffer();
		char errorMessage [] = "Vertex Not Set. Memory Overflow";
		FillOutputBufferWithError(errorMessage, strlen(errorMessage));
	}

	
}

// Updated
void ExecuteDeleteVertexOpCode()
{
	struct Vertex_Byte myVertex;

	unsigned int localCounter = 0;
	unsigned int counter = 1;
	unsigned char numBytes = GetNumberFromBuffer(inputBuffer, &counter, 1);
	AddBufferToBuffer(myVertex.txID, inputBuffer, STANDARD_ID_SIZE, &localCounter, &counter);
	localCounter = 0;
	AddBufferToBuffer(myVertex.rxID, inputBuffer, STANDARD_ID_SIZE, &localCounter, &counter);
	unsigned char txControl = GetNumberFromBuffer(inputBuffer, &counter, 1);
	unsigned char rxControl = GetNumberFromBuffer(inputBuffer, &counter, 1);

	struct HeepIPAddress vertexIP;
	vertexIP.Octet4 = GetNumberFromBuffer(inputBuffer, &counter, 1);
	vertexIP.Octet3 = GetNumberFromBuffer(inputBuffer, &counter, 1);
	vertexIP.Octet2 = GetNumberFromBuffer(inputBuffer, &counter, 1);
	vertexIP.Octet1 = GetNumberFromBuffer(inputBuffer, &counter, 1);
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

// Updated
// Validate that a MOP can be added. Then restructure it for localIDs as necessary
int ValidateAndRestructureIncomingMOP(unsigned int MOPStartAddr, unsigned int* numBytes)
{
	if(*numBytes < STANDARD_ID_SIZE + 2)
	{
		return 1; // INVALID MOP
	}

	heepByte curID [STANDARD_ID_SIZE];
	MOPStartAddr++;
	unsigned int startID = MOPStartAddr;
	unsigned int localCounter = 0;
	AddBufferToBuffer(curID, inputBuffer, STANDARD_ID_SIZE, &localCounter, &MOPStartAddr);
	unsigned char bytesOfData = GetNumberFromBuffer(inputBuffer, &MOPStartAddr, 1);
	GetIndexedDeviceID_Byte(curID);

	int memDiff = STANDARD_ID_SIZE - ID_SIZE;
	*numBytes = *numBytes - memDiff;

	localCounter = 0;
	AddBufferToBuffer(inputBuffer, curID, ID_SIZE, &startID, &localCounter);
	startID = AddCharToBuffer(inputBuffer, startID, bytesOfData);

	int i;
	for(i = 0; i < bytesOfData; i++)
	{
		inputBuffer[startID + i] = inputBuffer[startID + i + memDiff];
	}

	return 0;
}

void ExecuteDeleteMOPOpCode()
{
	unsigned int counter = 1;

	unsigned int numBytes = GetNumberFromBuffer(inputBuffer, &counter, 1);
	int dataError = ValidateAndRestructureIncomingMOP(counter, &numBytes);

	if(dataError == 0)
	{
		unsigned int theFoundCode = 0;
		unsigned int deviceMemCounter = 0;
		int MOPSDeleted = 0;

		while(deviceMemCounter < curFilledMemory)
		{
			int i;
			for(i = 0; i < numBytes; i++)
			{
				if(deviceMemory[deviceMemCounter+i] != inputBuffer[counter+i])
				{
					break;
				}

				theFoundCode++;
			}

			if(theFoundCode == numBytes)
			{
				deviceMemory[deviceMemCounter] = FragmentOpCode;
				deviceMemory[deviceMemCounter + 5] = numBytes;
				MOPSDeleted++;
			}
			theFoundCode = 0;

			deviceMemCounter = SkipOpCode(deviceMemCounter);
		}

		if(MOPSDeleted > 0)
		{
			ClearOutputBuffer();
			char SuccessMessage [] = "MOP Deleted!";
			FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
		}
		else
		{
			ClearOutputBuffer();
			char MyerrorMessage [] = "Cannot Delete: MOP not found";
			FillOutputBufferWithError(MyerrorMessage, strlen(MyerrorMessage));
		}
	}
	else
	{
		ClearOutputBuffer();
		char errorMessage [] = "Cannot Delete: Generic MOP was invalid!";
		FillOutputBufferWithError(errorMessage, strlen(errorMessage));
	}
}

void ExecuteAddMOPOpCode()
{
	unsigned int counter = 1;

	unsigned int numBytes = GetNumberFromBuffer(inputBuffer, &counter, 1);

	int dataError = ValidateAndRestructureIncomingMOP(counter, &numBytes);

	if(dataError == 0)
	{	
		int i;
		for(i = 0; i < numBytes; i++)
		{
			AddNewCharToMemory(inputBuffer[counter]);
			counter++;
		}

		ClearOutputBuffer();
		char SuccessMessage [] = "MOP Added!";
		FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
	}
	else
	{
		ClearOutputBuffer();
		char errorMessage [] = "Cannot Add: Delivered Generic MOP was determined to be invalid!";
		FillOutputBufferWithError(errorMessage, strlen(errorMessage));
	}

}

void ExecuteSetWiFiDataOpCode()
{
	int passwordFirstPosition = inputBuffer[3] + 4;
	AddWiFiSettingsToMemory( (char*)(&inputBuffer[4]), inputBuffer[3], (char*)(&inputBuffer[passwordFirstPosition+1]), inputBuffer[passwordFirstPosition], deviceIDByte, inputBuffer[2]);

	ClearOutputBuffer();
	char SuccessMessage [] = "WiFi Added!";
	FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
}

void ExecuteSetDeviceNameOpCode()
{
	SetDeviceNameInMemory_Byte((char*)(&inputBuffer[2]), inputBuffer[1], deviceIDByte);

	ClearOutputBuffer();
	char SuccessMessage [] = "Name Set!";
	FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
}

void ExecuteResetDeviceNetwork()
{
	resetHeepNetwork = 1;

	ClearOutputBuffer();
	char SuccessMessage [] = "Reset Initiated!";
	FillOutputBufferWithSuccess(SuccessMessage, strlen(SuccessMessage));
}

unsigned char IsROP()
{
	if(inputBuffer[0] == MemoryDumpOpCode 
		|| inputBuffer[0] == SuccessOpCode
		|| inputBuffer[0] == ErrorOpCode)
	{
		return 1;
	}

	return 0;
}

void ExecuteControlOpCodes()
{
	unsigned char ReceivedOpCode = inputBuffer[0];
	if(ReceivedOpCode == IsHeepDeviceOpCode)
	{
		ExecuteMemoryDumpOpCode();
	}
	else if(ReceivedOpCode == SetValueOpCode)
	{
		ExecuteSetValOpCode();
	}
	else if(ReceivedOpCode == SetPositionOpCode)
	{
		ExecuteSetPositionOpCode();
	}
	else if(ReceivedOpCode == SetVertexOpCode)
	{
		ExecuteSetVertexOpCode();
	}
	else if(ReceivedOpCode == DeleteVertexOpCode)
	{
		ExecuteDeleteVertexOpCode();
	}
	else if(ReceivedOpCode == AddMOPOpCode)
	{
		ExecuteAddMOPOpCode();
	}
	else if(ReceivedOpCode == DeleteMOPOpCode)
	{
		ExecuteDeleteMOPOpCode();
	}
	else if(ReceivedOpCode == SetWiFiDataOpCode)
	{
		ExecuteSetWiFiDataOpCode();
	}
	else if(ReceivedOpCode == SetNameOpCode)
	{
		ExecuteSetDeviceNameOpCode();
	}
	else if(ReceivedOpCode == ResetDeviceNetwork)
	{
		ExecuteResetDeviceNetwork();
	}
	else
	{
		char errorMessage [] = "Invalid COP Received";
		FillOutputBufferWithError(errorMessage, strlen(errorMessage));
	}
}