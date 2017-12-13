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