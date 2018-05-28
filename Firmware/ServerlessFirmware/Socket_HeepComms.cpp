#include "Socket_HeepComms.h"
#include <thread>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#include <arpa/inet.h>
#include <sys/socket.h>

#include "Heep_API.h"

#include <iostream>
// using namespace std;

struct sockaddr_in si_me, si_other;
int lastConnectFd = -1;
char recvBuffer[1500];
char respondedToLastConnect = 1;

#define BUFLEN 512  //Max length of buffer

void error(const char *msg)
{
    perror(msg);
    exit(1);
}

void die(char *s)
{
    perror(s);
    exit(1);
}

void CreateServer(int portno)
{
     
    int s, i, recv_len;
    socklen_t slen = sizeof(si_other);
    char buf[BUFLEN];
     
    //create a UDP socket
    if ((s=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == -1)
    {
        die("socket");
    }
     
    // zero out the structure
    memset((char *) &si_me, 0, sizeof(si_me));
     
    si_me.sin_family = AF_INET;
    si_me.sin_port = htons(portno);
    si_me.sin_addr.s_addr = htonl(INADDR_ANY);
     
    //bind socket to port
    // bind(s , (struct sockaddr*)&si_me, sizeof(si_me) ) ;
    if( bind(s , (struct sockaddr*)&si_me, sizeof(si_me) ) )
    {
        die("bind");
    }
     
    //keep listening for data
    while(1)
    {
#ifdef HEEP_DEBUG
        printf("Waiting for data...");
        fflush(stdout);
#endif
         
        //try to receive some data, this is a blocking call
        if ((recv_len = recvfrom(s, recvBuffer, BUFLEN, 0, (struct sockaddr *) &si_other, &slen)) == -1)
        {
            die("recvfrom()");
        }
         

        respondedToLastConnect = 0;

#ifdef HEEP_DEBUG
        //print details of the client/peer and the data received
        printf("Received packet from %s:%d\n", inet_ntoa(si_other.sin_addr), ntohs(si_other.sin_port));
        printf("Data: %s\n" , recvBuffer);
#endif

        inet_ntoa(si_other.sin_addr);
        ntohs(si_other.sin_port);
         
    }
 
    close(s);
}


int TCP_PORT = 5000;

void ServerThread()
{ 
#ifdef HEEP_DEBUG
    std::cout << "Begin Server" << std::endl;
#endif
    CreateServer(TCP_PORT);
}

std::thread* CreateServerThread;

void CreateInterruptServer()
{
  CreateServerThread = new std::thread(ServerThread);
}

void CheckServerForInputs()
{
    if(respondedToLastConnect == 0)
    {
      si_other.sin_port = htons(5000);

#ifdef HEEP_DEBUG
      std::cout << "Time to respond to " << inet_ntoa(si_other.sin_addr) << " " << ntohs(si_other.sin_port) << std::endl;
#endif
        inet_ntoa(si_other.sin_addr);
        ntohs(si_other.sin_port);

        int n = 0;

        for(int i = 0; i < 200; i++)
        {
          inputBuffer[i] = recvBuffer[i];
        }

        if(HandleHeepCommunications())
        {
            respondedToLastConnect = 1;
            return;
        }

        int s;
        socklen_t slen = sizeof(si_other);

        //create a UDP socket
        if ((s=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == -1)
        {
            die("socket");
        }

#ifdef HEEP_DEBUG
        for(int i = 0; i < outputBufferLastByte; i++)
        {
          std::cout << outputBuffer[i] << " ";
        }
        std::cout << std::endl;
#endif

        //now reply the client with the same data
        if (sendto(s, outputBuffer, outputBufferLastByte, 0, (struct sockaddr*) &si_other, slen) == -1)
        {
            die("sendto()");
        }

        close(s);

        lastConnectFd = -1;
        respondedToLastConnect = 1;
    }
    
}

int Write1Character1FromValue(unsigned char value, char* IPString, int startPoint)
{
  IPString[startPoint] = (value%10) + '0';
  startPoint++;
  return startPoint;
}

int Write2CharactersFromValue(unsigned char value, char* IPString, int startPoint)
{
  IPString[startPoint] = (value/10)%10 + '0';
  startPoint++;
  IPString[startPoint] = (value%10) + '0';
  startPoint++;
  return startPoint;
}

int Write3CharactersFromValue(unsigned char value, char* IPString, int startPoint)
{
  IPString[startPoint] = (value/100)%10 + '0';
  startPoint++;
  IPString[startPoint] = (value/10)%10 + '0';
  startPoint++;
  IPString[startPoint] = (value%10) + '0';
  startPoint++;
  return startPoint;
}

int WriteCharactersFromValue(unsigned char value, char* IPString, int startPoint)
{
    if(value < 10)
        return Write1Character1FromValue(value, IPString, startPoint);
    else if(value < 100)
        return Write2CharactersFromValue(value, IPString, startPoint);
    
    return Write3CharactersFromValue(value, IPString, startPoint);
}



void WriteHeepIPToString(HeepIPAddress destIP, char* IPString)
{
  int counter = WriteCharactersFromValue(destIP.Octet4, IPString, 0);
  IPString[counter] = '.'; counter++;
  counter = WriteCharactersFromValue(destIP.Octet3, IPString, counter);
  IPString[counter] = '.'; counter++;
  counter = WriteCharactersFromValue(destIP.Octet2, IPString, counter);
  IPString[counter] = '.'; counter++;
  counter = WriteCharactersFromValue(destIP.Octet1, IPString, counter);
  IPString[counter] = '\0';
}

void SendOutputBufferToIP(HeepIPAddress destIP)
{
    char IP [18];
    WriteHeepIPToString(destIP, IP);

    int sockfd, n;
    struct sockaddr_in serv_addr;
    struct hostent *server;
    socklen_t slen = sizeof(si_other);

    int s;

    server = gethostbyname(IP);
    if (server == NULL) {
#ifdef HEEP_DEBUG
        fprintf(stderr,"ERROR, no such host\n");
#endif
        exit(0);
    }
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, 
         (char *)&serv_addr.sin_addr.s_addr,
         server->h_length);
    serv_addr.sin_port = htons(TCP_PORT);

    //create a UDP socket
    if ((s=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == -1)
    {
        die("socket");
    }

// Strange bug on this line. Must comment out debug checks for code to send. Seems like timing
//#ifdef HEEP_DEBUG
    for(int i = 0; i < outputBufferLastByte; i++)
    {
      std::cout << outputBuffer[i] << " ";
    }
    std::cout << std::endl;
//#endif

    //now reply the client with the same data
    if (sendto(s, outputBuffer, outputBufferLastByte, 0, (struct sockaddr*) &serv_addr, slen) == -1)
    {
        die("sendto()");
    }

    close(s);
}