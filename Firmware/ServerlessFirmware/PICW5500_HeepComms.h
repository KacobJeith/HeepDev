#include "ActionAndResponseOpCodes.h"

int TCP_PORT = 5000;

void CreateInterruptServer()
{
  Listen(5000);
}

void CheckServerForInputs()
{
//	if (EthernetClient client = server.available())
//    {
//    	size_t size;
//	  	while((size = client.available()) > 0)
//	    {
//	      uint8_t* msg = (uint8_t*)malloc(size);
//	      size = client.read(msg,size);
//	      for(int i = 0; i < size; i++)
//	      {
//	      	inputBuffer[i] = msg[i];
//	      }
//	      free(msg);
//
//	      Serial.println("Received Data");
//	      ExecuteControlOpCodes();
//	  	}
//
//	  	client.write(outputBuffer, outputBufferLastByte);
//		client.stop();
//    }
    
    uint16_t curData = DataAvailable();
    if(curData > 0)
    {
        LATAbits.LA0 = 0;
        ReadData(inputBuffer, curData);
        ExecuteControlOpCodes();
        
//        uint8_t buf [5];
//        buf[0] = 'J';
//        buf[1] = 'a';
//        buf[2] = 'm';
//        buf[3] = 'e';
//        buf[4] = 's';
//        SendData(buf, 5);
        
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