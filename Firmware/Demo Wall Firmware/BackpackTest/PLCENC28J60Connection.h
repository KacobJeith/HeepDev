#include <UIPEthernet.h>
#include "StringUtils.h"

int TCP_PORT = 5000;

EthernetServer server = EthernetServer(TCP_PORT);
EthernetClient client;
IPAddress serverIP;
void ConnectToPLCServer()
{
	long next = 200;
	boolean FoundServer = false;
	uint8_t mac[6] = {0x00,0x01,0xFE,0x03,0x04,0x09};
  	Ethernet.begin(mac);
	serverIP = Ethernet.gatewayIP();

	for(int i = 1; i < 255; i++)
	{

		Serial.println(i);
		
		if(FoundServer)
			break;

		for(int j = 0; j < 5; j++)
		{
			if(FoundServer)
				break;

			if (client.connect(IPAddress(serverIP[0], serverIP[1], serverIP[2], i),TCP_PORT))
    		{
	          	String newConnectString = "IsPLCServer:";
	          	client.println(newConnectString);
	          	next = millis() + 200;
	          	while(client.available()==0)
	            {
	              	if (next - millis() < 0)
	               	goto searchClose;
	            }
	          	int size;
	          	while((size = client.available()) > 0)
	          	{
	              	uint8_t* msg = (uint8_t*)malloc(size);
	              	size = client.read(msg,size);
	              
		           	if(msg[0] == 'Y' && msg[1] == 'e' && msg[2] == 's')
		         	{
		             	serverIP = IPAddress(serverIP[0], serverIP[1], serverIP[2], i);
		             	Serial.print("Found server at: ");
		         		Serial.println(serverIP);
		            	FoundServer = true;
		          	}
		         	free(msg);
	          }
searchClose:
	          client.stop();
		    }
		}
	}
}

// Sends whatever is in the output buffer to the server
void SendDataToPLCServer(char* outputBuffer, char* inputBuffer)
{
	long next = 200;

	if (client.connect(serverIP,TCP_PORT))
	{
      	client.print(outputBuffer);
      	next = millis() + 200;
      	while(client.available()==0)
        {
        	long curTimeSigned = millis();
          	if (next - curTimeSigned < 0)
          	{
          		Serial.println("PastTimeout");
          		goto searchClose;
          	}
           
        }
      	int size;
      	while((size = client.available()) > 0)
      	{
      		Serial.println("Client Available is big");
          	uint8_t* msg = (uint8_t*)malloc(size);
          	size = client.read(msg,size);
          	//Serial.println(msg);

          	for(int i = 0; i < size; i++)
          	{
          		inputBuffer[i] = msg[i];
          	}

	     	free(msg);
      	}
searchClose:
      client.stop();
    }

}

void SendDataToPLCClient(char* outputBuffer, char* inputBuffer, char* destIP)
{
	// Get DestIP Ints
	int length = GetStringLength(destIP);

	int octetOne = 0;
	int octetTwo = 0;
	int octetThree = 0;
	int octetFour = 0;

	int octetNumber = 0;
	int lastDot = 0;

	for(int i = 0; i < length; i++)
	{
		if(destIP[i] == '.')
		{
			if(octetNumber == 0)
			{
				octetOne = ParseIntFromSubString(destIP, 0, i);
				octetNumber++;
				lastDot = i;
			}
			else if(octetNumber == 1)
			{
				octetTwo = ParseIntFromSubString(destIP, lastDot+1, i);
				octetNumber++;
				lastDot = i;
			}
			else if(octetNumber == 2)
			{
				octetThree = ParseIntFromSubString(destIP, lastDot+1, i);
				octetNumber++;
				lastDot = i;
			}

		}
	}

	octetFour = ParseIntFromSubString(destIP, lastDot+1, length);

	IPAddress clientIP(octetOne, octetTwo, octetThree, octetFour);

	long next = 200;

	Serial.println(clientIP);

	if (client.connect(clientIP,TCP_PORT))
	{
      	client.print(outputBuffer);
      	next = millis() + 200;
      	while(client.available()==0)
        {
        	long curTimeSigned = millis();
          	if (next - curTimeSigned < 0)
          	{
          		Serial.println("PastTimeout");
          		goto searchClose;
          	}
           
        }
      	int size;
      	while((size = client.available()) > 0)
      	{
      		Serial.println("Client Available is big");
          	uint8_t* msg = (uint8_t*)malloc(size);
          	size = client.read(msg,size);
          	//Serial.println(msg);

          	for(int i = 0; i < size; i++)
          	{
          		inputBuffer[i] = msg[i];
          	}

	     	free(msg);
      	}
searchClose:
      client.stop();
    }
}

void CreateInterruptServer()
{
	server.begin();
}

void CheckServerForInputs(char* inputBuffer)
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
	  	}
		  client.println("DATA from Server!");
		  client.stop();
    }
}
