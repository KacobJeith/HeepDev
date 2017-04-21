#include <UIPEthernet.h>
#include "ActionAndResponseOpCodes.h"

int TCP_PORT = 5000;
EthernetServer server = EthernetServer(TCP_PORT);
EthernetClient client;

void CreateInterruptServer()
{
	uint8_t mac[6] = {0x00,0x01,0x02,0x03,0x04,0x08};
  	Ethernet.begin(mac);
	IPAddress localIP = Ethernet.localIP();
	Serial.println(localIP);

	server.begin();
}

void CheckServerForInputs()
{
	if (EthernetClient client = server.available())
    {
    	size_t size;
	  	while((size = client.available()) > 0)
	    {
	      uint8_t* msg = (uint8_t*)malloc(size);
	      size = client.read(msg,size);
	      for(int i = 0; i < size; i++)
	      {
	      	inputBuffer[i] = msg[i];
	      }
	      free(msg);

	      Serial.println("I SAW SOMETHING");
	      ExecuteControlOpCodes();
	  	}

	  	// Must be a string. So I used a char
	  	char* outputData = (char*)malloc(outputBufferLastByte);

	  	for(int i = 0; i < outputBufferLastByte; i++)
	  	{
	  		outputData[i] = outputBuffer[i];
	  	}

	  	Serial.print("OUTPUT: ");
	  	Serial.println(outputData);

	  	client.print(outputData);
		client.stop();

		free(outputData);
    }
}

void SendOutputBufferToIP(HeepIPAddress destIP)
{
	IPAddress clientIP(destIP.Octet4, destIP.Octet3, destIP.Octet2, destIP.Octet1);

	long next = 200;

	Serial.println(clientIP);

	char* outputData = (char*)malloc(outputBufferLastByte);
	for(int i = 0; i < outputBufferLastByte; i++)
  	{
  		outputData[i] = outputBuffer[i];
  	}

	if (client.connect(clientIP,TCP_PORT))
	{
      	client.print(outputData);
      	next = millis() + 200;
      	while(client.available()==0)
        {
        	long curTimeSigned = millis();
          	if (next - curTimeSigned < 0)
          	{
          		Serial.println("PastTimeout");
          		goto pastTimeout;
          	}
           
        }

      	int size;
      	while((size = client.available()) > 0)
      	{
      		Serial.println("Client Available is big");
          	uint8_t* msg = (uint8_t*)malloc(size);
          	size = client.read(msg,size);

          	for(int i = 0; i < size; i++)
          	{
          		inputBuffer[i] = msg[i];
          	}

	     	free(msg);
      	}
pastTimeout:
      client.stop();
    }

    free(outputData);
}