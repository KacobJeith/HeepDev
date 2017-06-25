#include "ActionAndResponseOpCodes.h"

int TCP_PORT = 5000;

void CreateInterruptServer()
{
  Listen(5000);
}

void CheckServerForInputs()
{
    uint16_t curData = DataAvailable();
    if(curData > 0)
    {
        LATAbits.LA0 = 0;
        ReadData(inputBuffer, curData);
        ExecuteControlOpCodes();
        
        SendData(outputBuffer, outputBufferLastByte);
        Disconnect();
        Listen(5000);
    }
}

void SendOutputBufferToIP(struct HeepIPAddress destIP)
{
//	IPAddress clientIP(destIP.Octet4, destIP.Octet3, destIP.Octet2, destIP.Octet1);
//
//	long next = 200;
//
//	Serial.println(clientIP);
//
//	if (client.connect(clientIP,TCP_PORT))
//	{
//      	client.write(outputBuffer, outputBufferLastByte);
//      	next = millis() + 200;
//      	while(client.available()==0)
//        {
//        	long curTimeSigned = millis();
//          	if (next - curTimeSigned < 0)
//          	{
//          		Serial.println("PastTimeout");
//          		goto pastTimeout;
//          	}
//           
//        }
//
//      	int size;
//      	while((size = client.available()) > 0)
//      	{
//          	uint8_t* msg = (uint8_t*)malloc(size);
//          	size = client.read(msg,size);
//
//          	for(int i = 0; i < size; i++)
//          	{
//          		inputBuffer[i] = msg[i];
//          	}
//
//	     	free(msg);
//      	}
//pastTimeout:
//      client.stop();
//    }

}