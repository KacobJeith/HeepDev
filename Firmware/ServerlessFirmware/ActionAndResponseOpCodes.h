#include "Device.h"

void ClearOutputBuffer();

void ClearInputBuffer();
void AddNewCharToOutputBuffer(unsigned char newMem);

void AddDeviceIDToOutputBuffer_Byte(heepByte* deviceID);

void AddDeviceIDOrIndexToOutputBuffer_Byte(heepByte* deviceID);

#ifdef USE_ANALYTICS
void AddAnalyticsStringToOutputBufferAndDeleteMOPs();
#endif

unsigned long CalculateControlDataSize();

unsigned long CalculateCoreMemorySize();
void FillOutputBufferWithSetValCOP(unsigned char controlID, unsigned char value);

void FillOutputBufferWithSetValCOPBuffer(unsigned char controlID, heepByte* buffer, int bufferLength);

// Updated
void FillOutputBufferWithControlData();
// Updated
void FillOutputBufferWithDynamicMemorySize();

// Updated
void FillOutputBufferWithMemoryDump();

// Updated
void FillOutputBufferWithSuccess(char* message, int stringLength);

// Updated
void FillOutputBufferWithError(char* message, int stringLength);

void ExecuteMemoryDumpOpCode();

void ExecuteSetValOpCode();

// Updatded
void ExecuteSetPositionOpCode();

// Updated
void ExecuteSetVertexOpCode();

// Updated
void ExecuteDeleteVertexOpCode();

// Updated
// Validate that a MOP can be added. Then restructure it for localIDs as necessary
int ValidateAndRestructureIncomingMOP(unsigned int MOPStartAddr, unsigned int* numBytes);

void ExecuteDeleteMOPOpCode();

void ExecuteAddMOPOpCode();

unsigned char IsROP();

void ExecuteControlOpCodes();

