#include <SPI.h> 
#include <Ethernet.h>
#include <EthernetUdp.h> 
#include "ActionAndResponseOpCodes.h"

IPAddress ip(192, 168, 1, 177);
unsigned int localPort = 5000;  
int UDP_PORT = 5000;
// An EthernetUDP instance to let us send and receive packets over UDP
EthernetUDP Udp;

void CreateInterruptServer()
{
  Ethernet.begin(mac, ip);
  Udp.begin(localPort);

  IPAddress localIP = Ethernet.localIP();
  Serial.println(localIP);
}

void CheckServerForInputs()
{
  int packetSize = Udp.parsePacket();
  if (packetSize) {
    Serial.print("Received packet of size ");
    Serial.println(packetSize);
    Serial.print("From ");
    IPAddress remote = Udp.remoteIP();
    for (int i=0; i < 4; i++) {
      Serial.print(remote[i], DEC);
      if (i < 3) {
        Serial.print(".");
      }
    }
    Serial.print(", port ");
    Serial.println(Udp.remotePort());

    // read the packet into packetBufffer
    Udp.read(inputBuffer, INPUT_BUFFER_SIZE);
    Serial.println("Contents:");
    for(int i = 0; i < INPUT_BUFFER_SIZE; i++)
    {
      Serial.print((int)inputBuffer[i]);
      Serial.print(" ");
    }
    Serial.println();
    
    ExecuteControlOpCodes();

    for(int i = 0; i < outputBufferLastByte; i++)
    {
      Serial.print(outputBuffer[i]); Serial.print(" ");
    }
    Serial.println();

    // send a reply to the IP address and port that sent us the packet we received
    IPAddress remoteIP(Udp.remoteIP());
    Serial.print("Sending to: "); Serial.print(Udp.remoteIP());
    Udp.beginPacket(Udp.remoteIP(), localPort);
    Udp.write(outputBuffer, outputBufferLastByte);
    Udp.endPacket();
  }

}

void SendOutputBufferToIP(HeepIPAddress destIP)
{
  IPAddress clientIP(destIP.Octet4, destIP.Octet3, destIP.Octet2, destIP.Octet1);

  long next = 200;

  Serial.println(clientIP);

//  if (client.connect(clientIP,TCP_PORT))
//  {
//        client.write(outputBuffer, outputBufferLastByte);
//        next = millis() + 200;
//        while(client.available()==0)
//         {
//          long curTimeSigned = millis();
//            if (next - curTimeSigned < 0)
//            {
//              Serial.println("PastTimeout");
//              goto pastTimeout;
//            }
           
//         }

//        int size;
//        while((size = client.available()) > 0)
//        {
//            uint8_t* msg = (uint8_t*)malloc(size);
//            size = client.read(msg,size);

//            for(int i = 0; i < size; i++)
//            {
//              inputBuffer[i] = msg[i];
//            }

//        free(msg);
//        }
// pastTimeout:
//       client.stop();
//     }

}