#include "ActionAndResponseOpCodes.h"

int TCP_PORT = 5000;

void CreateInterruptServer()
{
  socket(1, Sn_MR_TCP, 5000, 0);
  listen(1);

}

void CheckServerForInputs()
{
    uint16_t curData = DataAvailable(1);
    if(curData > 0)
    {
        recv(1, inputBuffer, curData);
//        
        ExecuteControlOpCodes();
        send(1, outputBuffer, outputBufferLastByte);
        
        socket(1, Sn_MR_TCP, 5000, 0);
        listen(1);
    }
}

void SendOutputBufferToIP(struct HeepIPAddress destIP)
{
    LATAbits.LA0 = 1;
    uint8_t byteIP [4];
    byteIP[0] = destIP.Octet4;
    byteIP[1] = destIP.Octet3;
    byteIP[2] = destIP.Octet2;
    byteIP[3] = destIP.Octet1;
    uint16_t myPort = 5000;

    socket(2, Sn_MR_TCP, 1024, 0);
    
    connect(2, byteIP, myPort);
    send(2, outputBuffer, outputBufferLastByte);

    uint16_t curData = DataAvailable(2);
    if(curData > 0)
    {
        recv(2, inputBuffer, curData);
    }
    close(2);
}