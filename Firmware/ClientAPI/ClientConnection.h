#include "../Client/Client.h"
#include "../Utilities/globalDefines.h"

#ifdef ONPC
	#include <string>
#endif


class ClientConnection{
public:
	ClientConnection(Client myClient);
	~ClientConnection();

	void SendClientDataToServer();
	void GetQueuedCommandsFromServer();
	void SendClientVertexDataToServer();
	void GetVerticesFromServer();

#ifdef ONPC
	void EchoDataFromServer(std::string data);
#else
	void EchoDataFromServer(String data);
#endif

private:
	Client clientData;
};