#include "ESP8266_HeepComms.h"
#include "Heep_API.h"
#include <SPI.h> 
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <WiFiClientSecure.h>

#define HEEP_CONNECT_TIMEOUT 10000

unsigned int localPort = 5000;  
// An EthernetUDP instance to let us send and receive packets over UDP
WiFiUDP Udp;

String fallbackSSID = "SmoothHeep-2.4";
String fallbackPassword = "SenorEgg";

void CreateAccessPoint()
{
  Serial.println("Creating AP");
  
  uint8_t mac[WL_MAC_ADDR_LENGTH];
  WiFi.softAPmacAddress(mac);
  String macID = String(mac[WL_MAC_ADDR_LENGTH - 2], HEX) +
                 String(mac[WL_MAC_ADDR_LENGTH - 1], HEX);
  macID.toUpperCase();

  String AP_NameString = "Heep" + macID;
  String AP_Password = "HeepSecretPassword";

  Serial.println(AP_NameString);

  boolean result = WiFi.softAP(AP_NameString.c_str(), AP_Password.c_str());

  Serial.print("AP Result: "); Serial.println(result);
  Serial.println("AP UP");

  if(result == 1)
  {
    Serial.println("Creating Server");
    Serial.println("Server started");
  }
}

void CreateInterruptServer()
{
  boolean onFallback = false;
  unsigned long connectAttemptStartTime = 0;
  int currentWiFiPriorityID = 0;
  char currentSSID [20];
  char currentPassword [20];
  
  do{

    // Clear SSID and Password
    for(int i = 0; i < 20; i++)
    {
      currentSSID[i] = '\0';
      currentPassword[i] = '\0';
    }

    connectAttemptStartTime = millis();
    if(GetWiFiFromMemory(currentSSID, currentPassword, currentWiFiPriorityID) == 0){
      onFallback = false;
      Serial.print("Attempt SSID: "); Serial.println(currentSSID);
      Serial.print("Attempt Password: "); Serial.println(currentPassword);
      WiFi.begin(currentSSID, currentPassword);
    }
    else{
      onFallback = true;
      Serial.println("Attempting Fallback SSID");
      WiFi.begin(fallbackSSID.c_str(), fallbackPassword.c_str());
    }

    while ( (WiFi.status() != WL_CONNECTED) && (millis() - connectAttemptStartTime < HEEP_CONNECT_TIMEOUT) ) {
      delay(250);
      Serial.print(".");
    }

    if(WiFi.status() != WL_CONNECTED){
      currentWiFiPriorityID++;
    }
    else{
      Serial.println("");
      Serial.println("WiFi connected");
      Serial.print("IP address: ");
      Serial.println(WiFi.localIP());

      IPAddress localIP = WiFi.localIP();
      Serial.println(localIP);
    }

  }while(!onFallback && WiFi.status() != WL_CONNECTED); // Repeat until connected or fallback failed

  if(WiFi.status() != WL_CONNECTED){
    CreateAccessPoint();
  }
  
  Udp.begin(localPort);
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
      Udp.read(inputBuffer, inputBufferSize);
      Serial.println("Contents:");
      for(int i = 0; i < inputBufferSize; i++)
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

#ifdef USE_ANALYTICS

String base64_encode(const char* bytes_to_encode, unsigned int in_len) {
  String ret = "";
  int i = 0;
  int j = 0;
  unsigned char char_array_3[3];
  unsigned char char_array_4[4];

  while (in_len--) {
    char_array_3[i++] = *(bytes_to_encode++);
    if (i == 3) {
      char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
      char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
      char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
      char_array_4[3] = char_array_3[2] & 0x3f;

      for(i = 0; (i <4) ; i++)
        ret += base64_chars_esp[char_array_4[i]];
      i = 0;
    }
  }

  if (i)
  {
    for(j = i; j < 3; j++)
      char_array_3[j] = '\0';

    char_array_4[0] = ( char_array_3[0] & 0xfc) >> 2;
    char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
    char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);

    for (j = 0; (j < i + 1); j++)
      ret += base64_chars_esp[char_array_4[j]];

    while((i++ < 3))
      ret += '=';

  }

  return ret;

}

void SendDataToFirebase(heepByte *buffer, int length, heepByte* base64IDBuffer, int base64IDLength)
{
    // Use WiFiClientSecure class to create TLS connection
    WiFiClientSecure client;
    const int httpsPort = 443;

    String analyticsDataString = "";
    for(int i = 0; i < length; i++)
    {
      analyticsDataString += (char)buffer[i];
    }

    analyticsDataString = base64_encode(analyticsDataString.c_str(), analyticsDataString.length());

    String analyticsString = "{\"Base64\" : \"" + analyticsDataString + "\"}";
    String contentLengthString = String(analyticsString.length());

    String base64DeviceID = "";
    for(int i = 0; i < base64IDLength; i++)
      base64DeviceID += (char)base64IDBuffer[i];

    String host = "heep-3cddb.firebaseio.com";
    String url = "/analytics/" + base64DeviceID + ".json";
    Serial.print("connecting to ");
    Serial.println(host);

    if (!client.connect(host.c_str(), httpsPort)) {
      Serial.println("connection failed");
    }

    Serial.print("requesting URL ");
    Serial.println(url);

    client.print(String("POST ") + url + " HTTP/1.1\r\n" +
                 "Host: " + host + "\r\n" +
                 "Content-Length: " + contentLengthString + "\r\n" +
                 "Content-Type: application/json\r\n\r\n");

    client.print(analyticsString);

    // client.print(String("GET ") + url + " HTTP/1.1\r\n" +
    //              "Host: " + host + "\r\n" +
    //              "User-Agent: BuildFailureDetectorESP8266\r\n" +
    //              "Connection: close\r\n\r\n");

    Serial.println("request sent");

    while (client.connected()) {
      String line = client.readStringUntil('\n');
      Serial.println(line);
      if (line == "\r") {
        Serial.println("headers received");
        break;
      }
    }

    String payload = client.readString();

    Serial.println("reply was:");
    Serial.println("==========");
    Serial.println(payload);
    Serial.println("==========");
}

#endif
