void CreateInterruptServer()
{

}

void CheckServerForInputs()
{
	if(IsROP()) return;

    ExecuteControlOpCodes();
}

void SendOutputBufferToIP(struct HeepIPAddress destIP)
{

}

void SendDataToFirebase(heepByte *buffer, int length, heepByte* base64IDBuffer, int base64IDLength)
{
	
}