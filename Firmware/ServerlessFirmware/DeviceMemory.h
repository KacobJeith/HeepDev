#pragma once

#include "AutoGeneratedInfo.h"

// OPCodes
#define ClientDataOpCode 		 	0x01
#define ControlOpCode 			 	0x02
#define VertexOpCode 			 	0x03
#define IconIDOpCode 			 	0x04
#define CustomIconDrawingOpCode 	0x05
#define DeviceNameOpCode 		 	0x06
#define FrontEndPositionOpCode	 	0x07
#define DeviceIPOpCode 			 	0x08
	
#define IsHeepDeviceOpCode 		 	0x09
#define SetValueOpCode 			 	0x0A
#define SetPositionOpCode 		 	0x0B
#define SetVertexOpCode 		 	0x0C
#define DeleteVertexOpCode 		 	0x0D
#define EchoOpCode 				 	0x0E

#define MemoryDumpOpCode 			0x0F
#define SuccessOpCode 				0x10
#define ErrorOpCode 				0x11

#define FragmentOpCode 				0x12

#define AddMOPOpCode 				0x13
#define DynamicMemorySizeOpCode 	0x14
#define DeleteMOPOpCode 			0x15
#define LocalDeviceIDOpCode 		0x16

#define AnalyticsOpCode				0x1F

#define WiFiSSIDOpCode				0x20
#define WiFiPasswordOpCode			0x21

extern unsigned char deviceMemory[];
extern unsigned int curFilledMemory; // Indicate the curent filled memory. 
						 // Also serve as a place holder to 
						 // show the back of allocated memory
extern unsigned char memoryChanged;

extern unsigned char controlRegister;

void PerformPreOpCodeProcessing_Byte(heepByte* deviceID);
void SetControlRegister();

unsigned int SkipOpCode(unsigned int counter);
void ClearDeviceMemory();

void AddNewCharToMemory(unsigned char newMem);

void AddBufferToMemory(heepByte* buffer, heepByte size);

void CreateBufferFromNumber(heepByte* buffer, unsigned long number, heepByte size);

void AddNumberToMemoryWithSpecifiedBytes(unsigned long number, int numBytes);

void AddDeviceIDToMemory_Byte(heepByte* deviceID);
void AddIndexOrDeviceIDToMemory_Byte(heepByte* deviceID);

void AddIPToMemory(struct HeepIPAddress theIP);

void SetDeviceNameInMemory_Byte(char* deviceName, int numCharacters, heepByte* deviceID);
void SetIconIDInMemory_Byte(char iconID, heepByte* deviceID);

void SetIconDataInMemory_Byte(char* iconData, int numCharacters, heepByte* deviceID);

heepByte GetWiFiFromMemory(char* WiFiSSID, char* WiFiPassword, int priority);
void AddWiFiSettingsToMemory(char* WiFiSSID, int numCharSSID, char* WiFiPassword, int numCharPassword, heepByte* deviceID);

#ifdef USE_ANALYTICS

void SetAnalyticsDataControlValueInMemory_Byte(heepByte controlID, int controlValue, heepByte *deviceID);
int GetNextAnalyticsDataPointer(int startingPointer);

#endif

unsigned int ParseXYOpCode_Byte(int *x, int *y, heepByte* deviceID, unsigned int counter);

unsigned int GetXYFromMemory_Byte(int *x, int *y, heepByte* deviceID, unsigned int* XYMemPosition);

void SetXYInMemory_Byte(int x, int y, heepByte* deviceID);

void UpdateXYInMemory_Byte(int x, int y, heepByte* deviceID);

void SetIPInMemory_Byte(struct HeepIPAddress theIP, heepByte* deviceID);
void DeleteVertexAtPointer(unsigned long pointer);
int GetVertexAtPointer_Byte(unsigned long pointer, struct Vertex_Byte* returnedVertex);

int SetVertexInMemory_Byte(struct Vertex_Byte theVertex);

int GetNextVertexPointer(unsigned int* pointer,unsigned int* counter);

unsigned int GetFragmentFromMemory(int *pointerToFragment, int *numFragementBytes);
void RemoveUnusedBytesAtPointer(int pointer, int numBytes);
void DefragmentMemory();

// Returns size of returned buffer
heepByte GetIndexedDeviceID_Byte(heepByte* deviceID);

heepByte GetDeviceIDFromIndex_Byte(heepByte* index, heepByte* returnedID);
