#include "ClientConnection.h"

// API String Calls
#ifdef ONPC
	std::string NewConnectStr = "NewConnect:";
	std::string EchoStr = "Echo:";
	std::string GetQueuedCmdsStr = "GetQueuedControlData:";
	std::string GetClientVerticesStr = "GetClientVertices:";
#else
	String NewConnectStr = "NewConnect:";
	String EchoStr = "Echo:";
	String GetQueuedCmdsStr = "GetQueuedControlData:";
	String GetClientVerticesStr = "GetClientVertices:";
#endif
	
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