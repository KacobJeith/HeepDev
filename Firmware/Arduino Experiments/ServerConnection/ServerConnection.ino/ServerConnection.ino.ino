/*
 * UIPEthernet TcpClient example.
 *
 * UIPEthernet is a TCP/IP stack that can be used with a enc28j60 based
 * Ethernet-shield.
 *
 * UIPEthernet uses the fine uIP stack by Adam Dunkels <adam@sics.se>
 *
 *      -----------------
 *
 * This TcpClient example gets its local ip-address via dhcp and sets
 * up a tcp socket-connection to 192.168.0.1 port 5000 every 5 Seconds.
 * After sending a message it waits for a response. After receiving the
 * response the client disconnects and tries to reconnect after 5 seconds.
 *
 * Copyright (C) 2013 by Norbert Truchsess <norbert.truchsess@t-online.de>
 */

#include <UIPEthernet.h>

EthernetClient client;
signed long next;

IPAddress serverIP;

void setup() {

  Serial.begin(9600);

  Serial.println("Begin");

  uint8_t mac[6] = {0x00,0x01,0x02,0x03,0x04,0x05};
  Ethernet.begin(mac);

  Serial.print("localIP: ");
  Serial.println(Ethernet.localIP());
  Serial.print("subnetMask: ");
  Serial.println(Ethernet.subnetMask());
  Serial.print("gatewayIP: ");
  Serial.println(Ethernet.gatewayIP());
  Serial.print("dnsServerIP: ");
  Serial.println(Ethernet.dnsServerIP());

  IPAddress gateIP;
  gateIP = Ethernet.gatewayIP();
  for (int i = 0; i < 4; i++)
  {
    Serial.println(gateIP[i]);
  }

  boolean FoundServer = 0;

  for(int i = 140; i < 255; i++)
  {
    if(FoundServer)
      break;

    for(int j = 0; j < 4; j++)
    {
          if(FoundServer)
      break;

    Serial.println(i);
    //client.ResetChip();
    if (client.connect(IPAddress(gateIP[0], gateIP[1], gateIP[2], i),5000))
    {
         Serial.println("Client connected");
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
                Serial.println("Found Server");
                serverIP = IPAddress(gateIP[0], gateIP[1], gateIP[2], i);
                FoundServer = true;
              }
              free(msg);
          }
searchClose:
          //disconnect client
          Serial.println("Client disconnect");
          client.stop();
    }
  }

  next = 0;
    }

}

void loop() {

  if (((signed long)(millis() - next)) > 0)
    {
      next = millis() + 200;
      Serial.println("Client connect");
      // replace hostname with name of machine running tcpserver.pl
//      if (client.connect("server.local",5000))
      if (client.connect(serverIP,5000))
        {
          Serial.println("Client connected");
          String newConnectString = "NewConnect:";
          String clientString = "132,None,0,TestClient,1,1,Test Output,0,10,0,1,Test Input,0,10";
          String totalString = newConnectString + clientString;
          client.println(totalString);
          while(client.available()==0)
            {
              if (next - millis() < 0)
                goto close;
            }
          int size;
          while((size = client.available()) > 0)
            {
              uint8_t* msg = (uint8_t*)malloc(size);
              size = client.read(msg,size);
              Serial.write(msg,size);
              free(msg);
            }
close:
          //disconnect client
          Serial.println("Client disconnect");
          client.stop();
        }
      else
        Serial.println("Client connect failed");
    }
}
