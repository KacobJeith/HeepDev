#include "CommonDataTypes.h"

#define INPUT 0
#define OUTPUT 1

// Define the input and output buffers for global accessibility
extern unsigned char outputBuffer [];
extern unsigned int outputBufferLastByte;

extern unsigned char inputBuffer [];
extern unsigned int inputBufferLastByte;

extern unsigned int inputBufferSize;

extern unsigned char clearMemory;
void SetupHeepDevice(char* deviceName, char deviceIcon);
void FactoryReset(char* deviceName, char iconEnum);

void SendOutputByIDNoAnalytics(unsigned char controlID, unsigned int value);

void SendOutputByID(unsigned char controlID, unsigned int value);

void SendOutputByIDBuffer(unsigned char controlID, heepByte* buffer, int bufferLength);

void HandlePointersOnMemoryChange();

int GetControlValueByID(unsigned controlID);

void AddControl(struct Control myControl);

void SetupHeepTasks();

void CommitMemory();

unsigned char IsROP();

void ExecuteControlOpCodes();

#ifdef USE_ANALYTICS
void PostDataToFirebase();
#endif

// Control Daemon is untimed
void ControlDaemon();

void PerformHeepTasks();