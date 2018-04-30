#include "Simulation_HeepComms.h"
#include "Heep_API.h"

void CreateInterruptServer()
{

}

void CheckServerForInputs()
{
	if(HandleHeepCommunications()) return;
}

void SendOutputBufferToIP(struct HeepIPAddress destIP)
{

}

void BroadcastOutputBuffer()
{

}

void GetCurrentIP(struct HeepIPAddress* destIP)
{
	
}

#ifdef USE_ANALYTICS
void SendDataToFirebase(heepByte *buffer, int length, heepByte* base64IDBuffer, int base64IDLength)
{
	
}
#endif