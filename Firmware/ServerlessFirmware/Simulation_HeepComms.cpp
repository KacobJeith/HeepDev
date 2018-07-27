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

uint64_t GetRealTimeFromNetwork()
{
	return 0;
}

#ifdef USE_ANALYTICS
void SendDataToFirebase(heepByte *buffer, int length, heepByte* base64IDBuffer, int base64IDLength)
{
	
}
#endif