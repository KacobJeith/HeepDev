#include "ClientAPI.h"
#include <UIPEthernet.h>

int TCP_PORT = 5000;

EthernetClient client;
IPAddress serverIP;
void ConnectToPLCServer()
{
	long next = 200;
	boolean FoundServer = false;
	uint8_t mac[6] = {0x00,0x01,0x02,0x03,0x04,0x05};
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
	              	char* msg = (char*)malloc(size);
	              	size = client.read(msg,size);
	              	String retStr(msg);
	              	Serial.println(msg);
	              
	           	if(msg[0] == 'Y' && msg[1] == 'e' && msg[2] == 's')
	         	{
	             	serverIP = IPAddress(serverIP[0], serverIP[1], serverIP[2], i);
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

//char* SendDataToPLCServer(char* data);