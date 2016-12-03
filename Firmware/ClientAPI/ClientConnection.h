#include "../Client/Client.h"
#include "../Utilities/globalDefines.h"
#include "../ConnectionType/ConnectionInterface.h"

#ifdef ONPC
	#include <string>
#endif


class ClientConnection{
public:
	ClientConnection(Client myClient, ConnectionInterface* myInterface);
	~ClientConnection();

	void SendClientDataToServer();
	void GetQueuedCommandsFromServer();
	void SendClientVertexDataToServer();
	void GetVerticesFromServer();
	void FindPLCServer();

#ifdef ONPC
	void EchoDataFromServer(std::string data);
	std::string SendDataToServer(std::string data);
#else
	void EchoDataFromServer(String data);
	String SendDataToServer(String data);
#endif

private:
	Client clientData;
	ConnectionInterface* interface;
};