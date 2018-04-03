#include "CommonDataTypes.h"

// Input Outputs
#define HEEP_INPUT 0
#define HEEP_OUTPUT 1

// Control Types
#define HEEP_ONOFF 0
#define HEEP_RANGE 1
#define HEEP_BUFFER 2

// Icon Types
#define HEEP_ICON_NONE 0
#define HEEP_ICON_LIGHT_BULB 1
#define HEEP_ICON_LIGHT_SWITCH 2
#define HEEP_ICON_OUTLET 3
#define HEEP_ICON_POWER_BUTTON 4
#define HEEP_ICON_CUCKOO_CLOCK 5
#define HEEP_ICON_MAGLOCK 6
#define HEEP_ICON_RFID 7
#define HEEP_ICON_MOTOR 8

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

heepByte AddVertex(struct Vertex_Byte myVertex);

void SetupHeepTasks();

void CommitMemory();

heepByte HandleHeepCommunications();

#ifdef USE_ANALYTICS
void PostDataToFirebase();
#endif

void ControlDaemon();

void PerformHeepTasks();

void StartHeep(char* deviceName, heepByte deviceIcon);

void AddRangeControl(char* controlName, int inputOutput, int highValue, int lowValue, int startingValue);
void AddOnOffControl(char* controlName, int inputOutput, int startingValue);

int GetControlValueByName(char* controlName);
void SetControlValueByName(char* controlName, int newValue);

heepByte GetWiFiFromMemory(char* WiFiSSID, char* WiFiPassword, int priority);
void AddWiFiSettingsToMemory(char* WiFiSSID, int numCharSSID, char* WiFiPassword, int numCharPassword, heepByte* deviceID, heepByte IDPriority);
