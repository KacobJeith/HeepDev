#include "DeviceMemory.h"
#include "DeviceSpecificMemory.h"
#include "MemoryUtilities.h"

unsigned char deviceMemory [MAX_MEMORY];
unsigned int curFilledMemory = 0; // Indicate the curent filled memory. 
				 // Also serve as a place holder to 
				 // show the back of allocated memory
unsigned char memoryChanged = 0;

unsigned char controlRegister = 0;

void PerformPreOpCodeProcessing_Byte(heepByte* deviceID)
{
	// CopyDevice ID Into throw away buffer so that we don't corrupt original pointer
	heepByte copyID [STANDARD_ID_SIZE];
	AddDeviceIDToBuffer_Byte(copyID, deviceID, 0);
	GetIndexedDeviceID_Byte(copyID);
}

void SetControlRegister()
{
#ifdef USE_INDEXED_IDS
		controlRegister |= 0x04;

	#if ID_SIZE == 2
		controlRegister |= 0x01;
	#elif ID_SIZE == 3
		controlRegister |= 0x02;
	#elif ID_SIZE == 4
		controlRegister |= 0x03;
	#endif
#endif
}

unsigned int SkipOpCode(unsigned int counter)
{
	counter += ID_SIZE + 1;

	unsigned int bytesToSkip = deviceMemory[counter];
	counter += bytesToSkip + 1;

	return counter;
}

void ClearDeviceMemory()
{
	curFilledMemory = 0;
}

void AddNewCharToMemory(unsigned char newMem)
{
	curFilledMemory = AddCharToBuffer(deviceMemory, curFilledMemory, newMem);
	memoryChanged = 1;
}

void AddBufferToMemory(heepByte* buffer, heepByte size)
{
	unsigned int counter = 0;
	AddBufferToBuffer(deviceMemory, buffer, size, &curFilledMemory, &counter);
}

void CreateBufferFromNumber(heepByte* buffer, unsigned long number, heepByte size)
{
	AddNumberToBufferWithSpecifiedBytes(buffer, number, 0, size);
}

void AddNumberToMemoryWithSpecifiedBytes(unsigned long number, int numBytes)
{
	curFilledMemory = AddNumberToBufferWithSpecifiedBytes(deviceMemory, number, curFilledMemory, numBytes);
}

void AddDeviceIDToMemory_Byte(heepByte* deviceID)
{
	curFilledMemory = AddDeviceIDToBuffer_Byte(deviceMemory, deviceID, curFilledMemory);
}

void AddIndexOrDeviceIDToMemory_Byte(heepByte* deviceID)
{
	heepByte copyID [STANDARD_ID_SIZE];
	CopyDeviceID(deviceID, copyID);

	GetIndexedDeviceID_Byte(copyID);
	AddBufferToMemory(copyID, ID_SIZE);
}

void AddIPToMemory(struct HeepIPAddress theIP)
{
	AddNewCharToMemory(theIP.Octet4);
	AddNewCharToMemory(theIP.Octet3);
	AddNewCharToMemory(theIP.Octet2);
	AddNewCharToMemory(theIP.Octet1);
}

heepByte SetDeviceNameInMemory_Byte(char* deviceName, int numCharacters, heepByte* deviceID)
{
	int numBytesNeeded = 1 + ID_SIZE + 1 + numCharacters;
	if(WillMemoryOverflow(numBytesNeeded))
		return 1;

	int counter = 0;
	
	FragmentAllOfMOP(DeviceNameOpCode);

	PerformPreOpCodeProcessing_Byte(deviceID);

	AddNewCharToMemory(DeviceNameOpCode);
	AddIndexOrDeviceIDToMemory_Byte(deviceID);
	AddNewCharToMemory((char)numCharacters);

	int i;
	for(i = 0; i < numCharacters; i++)
	{
		AddNewCharToMemory(deviceName[i]);
	}

	return 0;
}

void SetIconIDInMemory_Byte(char iconID, heepByte* deviceID)
{
	PerformPreOpCodeProcessing_Byte(deviceID);

	AddNewCharToMemory(IconIDOpCode);
	AddIndexOrDeviceIDToMemory_Byte(deviceID);
	AddNewCharToMemory(1);
	AddNewCharToMemory(iconID);
}

void SetIconDataInMemory_Byte(char* iconData, int numCharacters, heepByte* deviceID)
{
	PerformPreOpCodeProcessing_Byte(deviceID);

	AddNewCharToMemory(CustomIconDrawingOpCode); 
	AddIndexOrDeviceIDToMemory_Byte(deviceID);
	AddNewCharToMemory((char)numCharacters);

	int i;
	for(i = 0; i < numCharacters; i++)
	{
		AddNewCharToMemory(iconData[i]);
	}
}

heepByte GetWiFiFromMemory(char* WiFiSSID, char* WiFiPassword, int priority)
{
	heepByte foundSSIDAndPassword = 0x00; // 0b00000011 When both found
	int counter = 0;
	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == WiFiSSIDOpCode)
		{
			if(deviceMemory[counter + ID_SIZE + 2] == priority)
			{
				unsigned int deviceMemoryCounter = counter + ID_SIZE + 3;
				unsigned int SSIDBufferCounter = 0;
				AddBufferToBuffer((heepByte*)WiFiSSID, deviceMemory, deviceMemory[counter + ID_SIZE + 1] - 1, &SSIDBufferCounter, &deviceMemoryCounter);
				foundSSIDAndPassword |= 0x01;
			}
		}
		else if(deviceMemory[counter] == WiFiPasswordOpCode)
		{
			if(deviceMemory[counter + ID_SIZE + 2] == priority)
			{
				unsigned int deviceMemoryCounter = counter + ID_SIZE + 3;
				unsigned int PasswordBufferCounter = 0;
				AddBufferToBuffer((heepByte*)WiFiPassword, deviceMemory, deviceMemory[counter + ID_SIZE + 1] - 1, &PasswordBufferCounter, &deviceMemoryCounter);
				foundSSIDAndPassword |= 0x02;
			}
		}

		counter = SkipOpCode(counter);

		if(foundSSIDAndPassword == 0x03){
			return 0;
		}
	}

	return 1; // No SSID Password Found at given Priority
}

heepByte DeleteWiFiSetting(int priority, heepByte* deviceID)
{
	heepByte foundSSIDAndPassword = 0x00; // 0b00000011 When both found
	int counter = 0;
	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == WiFiSSIDOpCode)
		{
			if(deviceMemory[counter + ID_SIZE + 2] == priority)
			{
				deviceMemory[counter] = FragmentOpCode;
			}
		}
		else if(deviceMemory[counter] == WiFiPasswordOpCode)
		{
			if(deviceMemory[counter + ID_SIZE + 2] == priority)
			{
				deviceMemory[counter] = FragmentOpCode;
			}
		}

		counter = SkipOpCode(counter);

		if(foundSSIDAndPassword == 0x03){
			return 0;
		}
	}

	return 1; // No SSID Password Found at given Priority
}

heepByte AddWiFiSettingsToMemory(char* WiFiSSID, int numCharSSID, char* WiFiPassword, int numCharPassword, heepByte* deviceID, heepByte IDPriority)
{
	DeleteWiFiSetting(IDPriority, deviceID);

	int numberOfBytesNeeded = 1 + ID_SIZE + 1 + 1 + numCharSSID;
	numberOfBytesNeeded += 1 + ID_SIZE + 1 + 1 + numCharPassword;
	if(WillMemoryOverflow(numberOfBytesNeeded))
		return 1;
	
	PerformPreOpCodeProcessing_Byte(deviceID);

	// WiFi
	AddNewCharToMemory(WiFiSSIDOpCode);
	AddIndexOrDeviceIDToMemory_Byte(deviceID);
	AddNewCharToMemory(1 + numCharSSID);
	AddNewCharToMemory(IDPriority);
	for(int i = 0; i < numCharSSID; i++)
	{
		AddNewCharToMemory(WiFiSSID[i]);
	}

	// Password
	AddNewCharToMemory(WiFiPasswordOpCode);
	AddIndexOrDeviceIDToMemory_Byte(deviceID);
	AddNewCharToMemory(1 + numCharPassword);
	AddNewCharToMemory(IDPriority);
	for(int i = 0; i < numCharPassword; i++)
	{
		AddNewCharToMemory(WiFiPassword[i]);
	}

	return 0;
}

#ifdef USE_ANALYTICS

void SetAnalyticsDataControlValueInMemory_Byte(heepByte controlID, int controlValue, heepByte *deviceID)
{
	// Get Time (Absolute or Relative to Device Start)
	// Set absolute byte to indicate 

	heepByte numBytesForTime = GetNumBytes64Bit(GetAnalyticsTime());

	heepByte totalBytesForAnalyticsMOP = 1 + ID_SIZE + 1 + numBytesForTime + 5;
	
	while(WillMemoryOverflow(totalBytesForAnalyticsMOP))
	{
		int firstAnalyticsData = GetNextAnalyticsDataPointer(0);
		if(firstAnalyticsData >= 0)
		{
			// Delete Analytics Data in FIFO Manner
			deviceMemory[firstAnalyticsData] = FragmentOpCode;
			DefragmentMemory();
		}
		else
		{
			// Something else has filled the memory, so we cannot add analytics
			return;
		}
	}

	PerformPreOpCodeProcessing_Byte(deviceID);

	AddNewCharToMemory(AnalyticsOpCode);
	AddIndexOrDeviceIDToMemory_Byte(deviceID);
	AddNewCharToMemory(numBytesForTime + 5);
	AddNewCharToMemory(controlID);
	AddNewCharToMemory(1); // 1 byte control values
	AddNewCharToMemory((heepByte)controlValue);
	AddNewCharToMemory(IsAbsoluteTime());
	AddNewCharToMemory(numBytesForTime);
	curFilledMemory = AddNumberToBufferWithSpecifiedBytes64Bit(deviceMemory, GetAnalyticsTime(), curFilledMemory, numBytesForTime);
}

int GetNextAnalyticsDataPointer(int startingPointer)
{
	unsigned int counter = startingPointer;

	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == AnalyticsOpCode)
		{
			return counter;
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	return -1;
}

uint64_t GetTimeFromAnalyticsMOP(int MOPAddress)
{
	unsigned int startCount = MOPAddress + ID_SIZE + 3 + deviceMemory[MOPAddress + ID_SIZE + 3] + 3;
	unsigned int numBytesTime = deviceMemory[startCount - 1];

	return GetNumberFromBuffer(deviceMemory, &startCount, numBytesTime);
}

#endif

unsigned int ParseXYOpCode_Byte(int *x, int *y, heepByte* deviceID, unsigned int counter)
{
	counter ++;
	counter = GetDeviceIDOrLocalIDFromBuffer(deviceMemory, deviceID, counter);
	GetNumberFromBuffer(deviceMemory, &counter, 1);
	*x = GetNumberFromBuffer(deviceMemory, &counter, 2);
	*y = GetNumberFromBuffer(deviceMemory, &counter, 2);

	return counter;
}

unsigned int GetXYFromMemory_Byte(int *x, int *y, heepByte* deviceID, unsigned int* XYMemPosition)
{
	unsigned int counter = 0;

	GetIndexedDeviceID_Byte(deviceID);

	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == FrontEndPositionOpCode)
		{
			*XYMemPosition = counter;

			heepByte tempID [ID_SIZE];
			counter = ParseXYOpCode_Byte(x, y, tempID, counter);

			if(CheckBufferEquality(deviceID, tempID, ID_SIZE))
			{
				return 0;
			}
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	return 1;
}

void SetXYInMemory_Byte(int x, int y, heepByte* deviceID)
{
	PerformPreOpCodeProcessing_Byte(deviceID);

	AddNewCharToMemory(FrontEndPositionOpCode);
	AddIndexOrDeviceIDToMemory_Byte(deviceID);
	AddNewCharToMemory((char)4);
	AddNumberToMemoryWithSpecifiedBytes(x, 2);
	AddNumberToMemoryWithSpecifiedBytes(y, 2);
}

heepByte UpdateXYInMemory_Byte(int x, int y, heepByte* deviceID)
{	
	heepByte copyID[STANDARD_ID_SIZE];
	CopyDeviceID(deviceID, copyID);

	int curX = 0; int curY = 0; 
	unsigned int XYMemPosition = 0;
	unsigned int success = GetXYFromMemory_Byte(&curX, &curY, copyID, &XYMemPosition);

	if(success == 0)
	{
		deviceMemory[XYMemPosition + ID_SIZE + 2] = (x >> 8)%256;
		deviceMemory[XYMemPosition + ID_SIZE + 3] = (x%256);
		deviceMemory[XYMemPosition + ID_SIZE + 4] = (y >> 8)%256;
		deviceMemory[XYMemPosition + ID_SIZE + 5] = (y%256);
	}
	else
	{
		if(WillMemoryOverflow(ID_SIZE+6))
			return 1;

		SetXYInMemory_Byte(x, y, deviceID);
	}

	memoryChanged = 1;

	return 0;
}

void SetIPInMemory_Byte(struct HeepIPAddress theIP, heepByte* deviceID)
{
	PerformPreOpCodeProcessing_Byte(deviceID);

	AddNewCharToMemory(DeviceIPOpCode);
	AddIndexOrDeviceIDToMemory_Byte(deviceID);
	AddNewCharToMemory((char)4);
	AddIPToMemory(theIP);
}

void DeleteVertexAtPointer(unsigned long pointer)
{
	deviceMemory[pointer] = FragmentOpCode;
	memoryChanged = 1;
}

int GetVertexAtPointer_Byte(unsigned long pointer, struct Vertex_Byte* returnedVertex)
{
	if(deviceMemory[pointer] != VertexOpCode)
		return 1;

	heepByte receiveIDLocal [ID_SIZE];
	heepByte sendIDLocal [ID_SIZE];
	heepByte receiveIDGlobal [STANDARD_ID_SIZE];
	heepByte sendIDGlobal [STANDARD_ID_SIZE];

	unsigned int counter = pointer + 1;

	counter = GetDeviceIDOrLocalIDFromBuffer(deviceMemory, sendIDLocal, counter);
	GetDeviceIDFromIndex_Byte(sendIDLocal, sendIDGlobal);
	CopyDeviceID(sendIDGlobal, (*returnedVertex).txID);

	int numBytes = GetNumberFromBuffer(deviceMemory, &counter, 1);

	counter = GetDeviceIDOrLocalIDFromBuffer(deviceMemory, receiveIDLocal, counter);
	GetDeviceIDFromIndex_Byte(receiveIDLocal, receiveIDGlobal);
	CopyDeviceID(receiveIDGlobal, (*returnedVertex).rxID);

	(*returnedVertex).txControlID = GetNumberFromBuffer(deviceMemory, &counter, 1);
	(*returnedVertex).rxControlID = GetNumberFromBuffer(deviceMemory, &counter, 1);
	(*returnedVertex).rxIPAddress.Octet4 = GetNumberFromBuffer(deviceMemory, &counter, 1);
	(*returnedVertex).rxIPAddress.Octet3 = GetNumberFromBuffer(deviceMemory, &counter, 1);
	(*returnedVertex).rxIPAddress.Octet2 = GetNumberFromBuffer(deviceMemory, &counter, 1);
	(*returnedVertex).rxIPAddress.Octet1 = GetNumberFromBuffer(deviceMemory, &counter, 1);

	return 0;
}

heepByte SetVertexInMemory_Byte(struct Vertex_Byte theVertex, unsigned int* vertexPointer)
{
	int numBytesNeeded = 1 + ID_SIZE + ID_SIZE + 7;
	if(WillMemoryOverflow(numBytesNeeded))
		return 1;

	PerformPreOpCodeProcessing_Byte(theVertex.txID);
	PerformPreOpCodeProcessing_Byte(theVertex.rxID);
	
	heepByte copyIDTx[STANDARD_ID_SIZE];
	CopyDeviceID(theVertex.txID, copyIDTx);
	heepByte copyIDRx[STANDARD_ID_SIZE];
	CopyDeviceID(theVertex.rxID, copyIDRx);

	*vertexPointer = curFilledMemory;

	AddNewCharToMemory(VertexOpCode);
	AddIndexOrDeviceIDToMemory_Byte(copyIDTx);
	AddNewCharToMemory((char)ID_SIZE+6);
	AddIndexOrDeviceIDToMemory_Byte(copyIDRx);
	AddNewCharToMemory(theVertex.txControlID);
	AddNewCharToMemory(theVertex.rxControlID);
	AddIPToMemory(theVertex.rxIPAddress);

	memoryChanged = 1;

	return 0;
}

int GetNextVertexPointer(unsigned int* pointer,unsigned int* counter)
{
	while(*counter < curFilledMemory)
	{
		if(deviceMemory[*counter] == VertexOpCode)
		{
			*pointer = *counter;

			*counter = SkipOpCode(*counter);
			return 0;
		}
		else
		{
			*counter = SkipOpCode(*counter);
		}
	}

	return 1;
}

unsigned int GetFragmentFromMemory(int *pointerToFragment, int *numFragementBytes)
{
	unsigned int counter = 0;

	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == FragmentOpCode)
		{
			*pointerToFragment = counter;

			*numFragementBytes = 2 + ID_SIZE + deviceMemory[counter + ID_SIZE + 1];

			return 0;
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	return 1;
}

void RemoveUnusedBytesAtPointer(int pointer, int numBytes)
{
	int i;
	for(i = 0; i < curFilledMemory - numBytes - pointer; i++)
	{
		deviceMemory[pointer+i] = deviceMemory[pointer+numBytes+i];
	}

	curFilledMemory -= numBytes;
}

void DefragmentMemory()
{
	int isFragmentFound = 0;
	do
	{
		int pointerToFragment = 0; int numFragementBytes = 0;
		isFragmentFound = GetFragmentFromMemory(&pointerToFragment, &numFragementBytes);

		if(isFragmentFound == 0)
		{
			RemoveUnusedBytesAtPointer(pointerToFragment, numFragementBytes);
			memoryChanged = 1;
		}

	}while(isFragmentFound == 0);
}

// Returns size of returned buffer
heepByte GetIndexedDeviceID_Byte(heepByte* deviceID)
{
#ifdef USE_INDEXED_IDS
	unsigned int counter = 0;
	unsigned long topIndex = 0;

	heepByte localID [ID_SIZE];

	// Find Indexed ID
	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == LocalDeviceIDOpCode)
		{
			counter++;
			unsigned long indexedValue = GetNumberFromBuffer(deviceMemory, &counter, ID_SIZE);
			counter++;

			heepByte foundID [STANDARD_ID_SIZE];
			counter = GetFullDeviceIDFromBuffer(deviceMemory, foundID, counter);

			if(indexedValue == topIndex)
			{
				topIndex = indexedValue + 1;
			}

			if(CheckBufferEquality(deviceID, foundID, STANDARD_ID_SIZE))
			{
				CreateBufferFromNumber(localID, indexedValue, ID_SIZE);
				unsigned int rxCounter = 0;
				unsigned int txCounter = 0;
				AddBufferToBuffer(deviceID, localID, ID_SIZE, &rxCounter, &txCounter);
				return ID_SIZE;
			}
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	CreateBufferFromNumber(localID, topIndex, ID_SIZE);

	// If Not Indexed, then index it!
	AddNewCharToMemory(LocalDeviceIDOpCode);
	AddBufferToMemory(localID, ID_SIZE);
	AddNewCharToMemory(STANDARD_ID_SIZE);
	AddDeviceIDToMemory_Byte(deviceID);

	unsigned int rxCounter = 0;
	unsigned int txCounter = 0;
	AddBufferToBuffer(deviceID, localID, ID_SIZE, &rxCounter, &txCounter);

	return ID_SIZE;
#else 
	return STANDARD_ID_SIZE;
#endif
}

heepByte GetDeviceIDFromIndex_Byte(heepByte* index, heepByte* returnedID)
{
#ifdef USE_INDEXED_IDS

	unsigned int counter = 0;
	unsigned long sentIndex = GetNumberFromBuffer(index, &counter, ID_SIZE);
	counter = 0;

	// Find Indexed ID
	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == LocalDeviceIDOpCode)
		{
			counter++;
			unsigned long indexedValue = GetNumberFromBuffer(deviceMemory, &counter, ID_SIZE);
			counter++;
			counter = GetFullDeviceIDFromBuffer(deviceMemory, returnedID, counter);

			if(indexedValue == sentIndex)
			{
				return STANDARD_ID_SIZE; // Found ID
			}
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	return 0; // No ID Found

#else
	GetDeviceIDOrLocalIDFromBuffer(index, returnedID, 0);
	return STANDARD_ID_SIZE; // Index is just device ID!
#endif
}

heepByte WillMemoryOverflow(int numBytesToBeAdded)
{
	if(numBytesToBeAdded + curFilledMemory >= MAX_MEMORY)
	{
		return 1;
	}

	return 0;
}

void FragmentAllOfMOP(heepByte inputMOP)
{
	unsigned int counter = 0;
	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == inputMOP)
			deviceMemory[counter] = FragmentOpCode;

		counter = SkipOpCode(counter);
	}
}

void ImmediatelyClearAllOfMOP(heepByte inputMOP)
{
	FragmentAllOfMOP(inputMOP);
	DefragmentMemory();
}
