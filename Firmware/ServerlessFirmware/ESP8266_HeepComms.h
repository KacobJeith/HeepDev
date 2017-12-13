#include <SPI.h> 
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>

String SSID = "FiOS-DE77K";
String Password = "deer843fog5213glen";

unsigned int localPort = 5000;  
int UDP_PORT = 5000;
// An EthernetUDP instance to let us send and receive packets over UDP
WiFiUDP Udp;

void CreateInterruptServer()
{
  WiFi.begin(SSID.c_str(), Password.c_str());

  while (WiFi.status() != WL_CONNECTED) {
    delay(250);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  while(WiFi.status() != WL_CONNECTED);

  Udp.begin(localPort);

  IPAddress localIP = WiFi.localIP();
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