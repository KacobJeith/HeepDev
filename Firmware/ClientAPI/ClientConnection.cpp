#include "ClientConnection.h"

// API String Calls
#ifdef ONPC
	std::string NewConnectStr = "NewConnect:";
	std::string EchoStr = "Echo:";
	std::string GetQueuedCmdsStr = "GetQueuedControlData:";
	std::string GetClientVerticesStr = "GetClientVertices:";
	std::string UpdateClientVertexStr = "UpdateClientVertex:";
	std::string IsPLCServerStr = "IsPLCServer:";
#else
	String NewConnectStr = "NewConnect:";
	String EchoStr = "Echo:";
	String GetQueuedCmdsStr = "GetQueuedControlData:";
	String GetClientVerticesStr = "GetClientVertices:";
	String UpdateClientVertexStr = "UpdateClientVertex:";
	String IsPLCServerStr = "IsPLCServer:";
#endif

ClientConnection::ClientConnection(Client myClient)
	: clientData(myClient)
{
}

ClientConnection::~ClientConnection()
{
}

void ClientConnection::FindPLCServer()
{
	SendDataToServer(IsPLCServerStr);
}

void ClientConnection::SendClientDataToServer()
{
	SendDataToServer(NewConnectStr + clientData.GetClientString());
}

void ClientConnection::GetQueuedCommandsFromServer()
{
	SendDataToServer(GetQueuedCmdsStr);
}

void ClientConnection::SendClientVertexDataToServer()
{
	SendDataToServer(UpdateClientVertexStr);
}

void ClientConnection::GetVerticesFromServer()
{
	SendDataToServer(GetClientVerticesStr);
}

#ifdef ONPC
void ClientConnection::EchoDataFromServer(std::string data)
{
	SendDataToServer(EchoStr + data);
}

std::string ClientConnection::SendDataToServer(std::string data)
{
	return "Test";
}
#else
void ClientConnection::EchoDataFromServer(String data)
{

}

String ClientConnection::SendDataToServer(String data)
{
	return "Test";
}
#endif