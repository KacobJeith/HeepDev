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
	clientData.AddVerticesFromString(SendDataToServer(GetClientVerticesStr));
}

#ifdef ONPC
void ClientConnection::EchoDataFromServer(std::string data)
{
	SendDataToServer(EchoStr + data);
}

std::string ClientConnection::SendDataToServer(std::string data)
{
	return "input,output,myIP,12,34;Clinput,Cloutput,my2IP,142,324;dgda,asfg,sdfa,5123,31234;";
}
#else
void ClientConnection::EchoDataFromServer(String data)
{
	SendDataToServer(EchoStr + data);
}

String ClientConnection::SendDataToServer(String data)
{
	return "Test";
}
#endif