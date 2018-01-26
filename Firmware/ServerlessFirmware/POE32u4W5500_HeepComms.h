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
  delay(100);
  digitalWrite(WIZ_RESET_PIN, LOW);
  delay(100);
  digitalWrite(WIZ_RESET_PIN, HIGH);
}

void CreateInterruptServer()
{
  ResetW5500();

  Ethernet.init(WIZ_CS_PIN);
  Ethernet.begin(mac);
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
    
    if(IsROP()) return;

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

  Udp.beginPacket(clientIP, localPort);
  Udp.write(outputBuffer, outputBufferLastByte);
  Udp.endPacket();

}