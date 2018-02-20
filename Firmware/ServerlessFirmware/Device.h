#include "DeviceMemory.h"

extern unsigned int firmwareVersion;

extern struct Control controlList [NUM_CONTROLS];
extern unsigned int numberOfControls;

extern unsigned int vertexPointerList[NUM_VERTICES];
extern unsigned int numberOfVertices;

void ClearControls();
void ClearVertices();
void AddControl(struct Control myControl);

unsigned char isVertexEqual(struct Vertex_Byte* vertex1, struct Vertex_Byte* vertex2);

void AddVertexPointer(unsigned int pointer);

void AddVertex(struct Vertex_Byte myVertex);

void RemoveVertexListEntry(unsigned int pointer);

int DeleteVertex(struct Vertex_Byte myVertex);

void FillVertexListFromMemory();

void SetDeviceName(char* deviceName);

void SetDeviceIcon(char deviceIcon);

int SetControlValueByID(unsigned char controlID, unsigned int value, unsigned char setFromNetwork);

heepByte GetControlTypeFromControlID(heepByte controlID);

int SetControlValueByIDBuffer(unsigned char controlID, heepByte* buffer, int bufferStartPoint, int bufferLength, unsigned char setFromNetwork);

int SetControlValueByIDFromNetwork(unsigned char controlID, unsigned int value);

int SetControlValueByIDFromNetworkBuffer(unsigned char controlID, heepByte* buffer, int bufferStartPoint, int bufferLength);

int GetControlValueByID(unsigned controlID);
