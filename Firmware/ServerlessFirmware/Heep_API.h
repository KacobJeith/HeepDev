#include "Scheduler.h"

extern unsigned char clearMemory;
void SetupHeepDevice(char* deviceName, char deviceIcon);
void FactoryReset(char* deviceName, char iconEnum);

void SendOutputByIDNoAnalytics(unsigned char controlID, unsigned int value);

void SendOutputByID(unsigned char controlID, unsigned int value);

void SendOutputByIDBuffer(unsigned char controlID, heepByte* buffer, int bufferLength);

void HandlePointersOnMemoryChange();

void SetupHeepTasks();

void CommitMemory();

#ifdef USE_ANALYTICS
void PostDataToFirebase();
#endif

// Control Daemon is untimed
void ControlDaemon();

void PerformHeepTasks();