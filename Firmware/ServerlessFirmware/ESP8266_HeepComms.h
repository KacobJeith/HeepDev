#include <SPI.h> 
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>

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

String GetAnalyticsString()
{
  String analyticsString = "";
  int AnalyticsPointer = 0;
  do
  {
      AnalyticsPointer = GetNextAnalyticsDataPointer(AnalyticsPointer);

      if(AnalyticsPointer > 0)
      {
        int numBytes = deviceMemory[AnalyticsPointer + STANDARD_ID_SIZE + 1];
        
        for(int i = AnalyticsPointer; i < AnalyticsPointer + numBytes + STANDARD_ID_SIZE + 1; i++)
        {
          analyticsString += deviceMemory[i];
        }

        deviceMemory[AnalyticsPointer] = FragmentOpCode;
      }

  }while(AnalyticsPointer != -1);

  return analyticsString;
}

void SendDataToFirebase()
{
    String analyticsString = {\"AnalyticsString\" : \"" + GetAnalyticsString() + "\"}";
    String contentLengthString = String(analyticsString.length());

    String base64DeviceID = "";
    for(int i = 0; i < STANDARD_ID_SIZE_BASE_64; i++)
      base64DeviceID += base64DeviceIDByte[i];

    String host = "heep-3cddb.firebaseio.com";
    String url = "/analytics/" + base64DeviceID + ".json";
    Serial.print("connecting to ");
    Serial.println(host);

    if (!client.connect(host.c_str(), httpsPort)) {
      Serial.println("connection failed");
      return "bad";
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
      if(line.indexOf("Date") != -1)
      {
        mostRecentDateString = line;
      }
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
    return payload;
}