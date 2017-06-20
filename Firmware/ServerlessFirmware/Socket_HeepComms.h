#include "ActionAndResponseOpCodes.h"
#include <thread>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#include <iostream>
using namespace std;

int lastConnectFd = -1;
char recvBuffer[1500];
char respondedToLastConnect = 1;

void error(const char *msg)
{
    perror(msg);
    exit(1);
}

void CreateServer(int portno)
{
    int sockfd, newsockfd;
    socklen_t clilen;

    struct sockaddr_in serv_addr, cli_addr;
    int n;

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
     if (sockfd < 0) 
        error("ERROR opening socket");
     bzero((char *) &serv_addr, sizeof(serv_addr));

     serv_addr.sin_family = AF_INET;
     serv_addr.sin_addr.s_addr = INADDR_ANY;
     serv_addr.sin_port = htons(portno);
     if (bind(sockfd, (struct sockaddr *) &serv_addr,
              sizeof(serv_addr)) < 0) 
              error("ERROR on binding");
     listen(sockfd,5);
     clilen = sizeof(cli_addr);

     while(1)
     {
        lastConnectFd = accept(sockfd, 
                 (struct sockaddr *) &cli_addr, 
                 &clilen);
         if (lastConnectFd < 0) 
              error("ERROR on accept");
         bzero(recvBuffer,1500);
         n = read(lastConnectFd,recvBuffer,1500);
         if (n < 0) error("ERROR reading from socket");
         printf("Here is the message: %s\n",recvBuffer);
         respondedToLastConnect = 0;
     }
     
     close(sockfd);
}


int TCP_PORT = 5000;

void ServerThread()
{ 
    cout << "Begin Server" << endl;
    CreateServer(TCP_PORT);
}

std::thread* CreateServerThread;

void CreateInterruptServer()
{
  CreateServerThread = new std::thread(ServerThread);
}

void CheckServerForInputs()
{
    if(respondedToLastConnect == 0 && lastConnectFd >= 0)
    {
        int n = 0;

        for(int i = 0; i < 200; i++)
        {
          inputBuffer[i] = recvBuffer[i];
        }

        ExecuteControlOpCodes();
        n = write(lastConnectFd,outputBuffer,outputBufferLastByte);
        if (n < 0) error("ERROR writing to socket");
        close(lastConnectFd);

        lastConnectFd = -1;
        respondedToLastConnect = 1;
    }
    
}

int Write3CharactersFromValue(unsigned char value, char* IPString, int startPoint)
{
  IPString[startPoint] = (value/100)%10;
  startPoint++;
  IPString[startPoint] = (value/10)%10;
  startPoint++;
  IPString[startPoint] = (value%10);
  startPoint++;
  return startPoint;
}

void WriteHeepIPToString(HeepIPAddress destIP, char* IPString)
{
  int counter = Write3CharactersFromValue(destIP.Octet4, IPString, 0);
  IPString[counter] = '.'; counter++;
  counter = Write3CharactersFromValue(destIP.Octet3, IPString, counter);
  IPString[counter] = '.'; counter++;
  counter = Write3CharactersFromValue(destIP.Octet2, IPString, counter);
  IPString[counter] = '.'; counter++;
  counter = Write3CharactersFromValue(destIP.Octet1, IPString, counter);
}

void SendOutputBufferToIP(HeepIPAddress destIP)
{
    char IP [17];
    WriteHeepIPToString(destIP, IP);

    int sockfd, n;
    struct sockaddr_in serv_addr;
    struct hostent *server;

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) 
        error("ERROR opening socket");
    server = gethostbyname(IP);
    if (server == NULL) {
        fprintf(stderr,"ERROR, no such host\n");
        exit(0);
    }

    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, 
         (char *)&serv_addr.sin_addr.s_addr,
         server->h_length);
    serv_addr.sin_port = htons(TCP_PORT);
    if (connect(sockfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0) 
        error("ERROR connecting");

    n = write(sockfd,outputBuffer,outputBufferLastByte);
    if (n < 0) 
         error("ERROR writing to socket");

    bzero(inputBuffer,200);
    n = read(sockfd,inputBuffer,200);
    if (n < 0) 
         error("ERROR reading from socket");
    printf("%s\n",inputBuffer);
    close(sockfd);
}