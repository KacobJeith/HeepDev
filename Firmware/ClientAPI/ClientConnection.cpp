#include "ClientConnection.h"

ClientConnection::ClientConnection(Client myClient)
	: clientData(myClient)
{
}

ClientConnection::~ClientConnection()
{
}

void ClientConnection::SendClientDataToServer()
{

}

void ClientConnection::GetQueuedCommandsFromServer()
{

}

void ClientConnection::SendClientVertexDataToServer()
{

}

void ClientConnection::GetVerticesFromServer()
{

}

#ifdef ONPC
void ClientConnection::EchoDataFromServer(std::string data)
{

}
#else
void ClientConnection::EchoDataFromServer(String data)
{

}
#endif