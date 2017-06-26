#include "ActionAndResponseOpCodes.h"

int TCP_PORT = 5000;

void CreateInterruptServer()
{
  Listen(5000, 0);
}

void CheckServerForInputs()
{
    uint16_t curData = DataAvailable(0);
    if(curData > 0)
    {
        LATAbits.LA0 = 0;
        ReadData(inputBuffer, curData, 0);
        ExecuteControlOpCodes();
        
        SendData(outputBuffer, outputBufferLastByte, 0);
        Disconnect(0);
        Listen(5000, 0);
    }
}

void SendOutputBufferToIP(struct HeepIPAddress destIP)
{
    uint8_t byteIP [4];
    byteIP[0] = destIP.Octet4;
    byteIP[1] = destIP.Octet3;
    byteIP[2] = destIP.Octet2;
    byteIP[3] = destIP.Octet1;
    uint16_t myPort = 5000;
    uint8_t destPort[2];
    destPort[0] = myPort >> 8;
    destPort[1] = myPort & 0xFF;

    ConnectToIP(byteIP, destPort, 1);
    SendData(outputBuffer, outputBufferLastByte, 1);
    
    // Wait for data available in timeout
    uint16_t curData = 0;
    do
    {
        curData = DataAvailable(1);
    }while(curData == 0);
 
    ReadData(inputBuffer, curData, 1);
    Disconnect(1);
}