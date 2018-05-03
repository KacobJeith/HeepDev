 #include "POE32u4W5500_HeepComms.h"
#include "Heep_API.h"
#include <SPI.h>
#include <Ethernet2.h>

unsigned int localPort = 5000;  
// An EthernetUDP instance to let us send and receive packets over UDP
EthernetUDP Udp;

#define WIZ_RESET_PIN 30
#define WIZ_CS_PIN 17

void ResetW5500()
{
  pinMode(WIZ_RESET_PIN, OUTPUT);
  digitalWrite(WIZ_RESET_PIN, HIGH);
  delay(250);
  digitalWrite(WIZ_RESET_PIN, LOW);
  delay(250);
  digitalWrite(WIZ_RESET_PIN, HIGH);
}

void CreateInterruptServer()
{
  ResetW5500();
  Serial.println("BEFORE BEGIN");
  Ethernet.init(WIZ_CS_PIN);
  Ethernet.begin(mac);
  
  Serial.println("AFTER BEGIN");
  Udp.begin(localPort);

  IPAddress localIP = Ethernet.localIP();
  Serial.println(localIP);
}

void CheckServerForInputs()
{
  int packetSize = Udp.parsePacket();
  if (packetSize) {

    #ifdef ENABLE_DEBUG_PRINTS
    Serial.print("Received packet of size ");
    Serial.println(packetSize);
    Serial.print("From ");
    #endif

    IPAddress remote = Udp.remoteIP();

    #ifdef ENABLE_DEBUG_PRINTS
    for (int i=0; i < 4; i++) {
      Serial.print(remote[i], DEC);
      if (i < 3) {
        Serial.print(".");
      }
    }
    Serial.print(", port ");
    Serial.println(Udp.remotePort());
    #endif

    // read the packet into packetBufffer
    Udp.read(inputBuffer, inputBufferSize);
    #ifdef ENABLE_DEBUG_PRINTS
    Serial.println("Contents:");
    for(int i = 0; i < inputBufferSize; i++)
    {
      Serial.print((int)inputBuffer[i]);
      Serial.print(" ");
    }
    Serial.println();
    #endif
    
    if(HandleHeepCommunications()) return;

    #ifdef ENABLE_DEBUG_PRINTS
    for(int i = 0; i < outputBufferLastByte; i++)
    {
      Serial.print(outputBuffer[i]); Serial.print(" ");
    }
    Serial.println();
    #endif

    // send a reply to the IP address and port that sent us the packet we received
    IPAddress remoteIP(Udp.remoteIP());

    #ifdef ENABLE_DEBUG_PRINTS
    Serial.print("Sending to: "); Serial.print(Udp.remoteIP());
    #endif

    Udp.beginPacket(Udp.remoteIP(), localPort);
    Udp.write(outputBuffer, outputBufferLastByte);
    Udp.endPacket();
  }

}

void SendOutputBufferToIP(struct HeepIPAddress destIP)
{
  IPAddress clientIP(destIP.Octet4, destIP.Octet3, destIP.Octet2, destIP.Octet1);

  long next = 200;

  #ifdef ENABLE_DEBUG_PRINTS
  Serial.println(clientIP);
  #endif

  Udp.beginPacket(clientIP, localPort);
  Udp.write(outputBuffer, outputBufferLastByte);
  Udp.endPacket();

}
