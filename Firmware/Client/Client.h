#include "../Utilities/GlobalDefines.h"

#ifdef ONPC
#include <string>
#endif

class Client {
public:
	Client();

#ifdef ONPC
	Client(int ID, std::string name);
#else
	Client(int ID, String name)
#endif
	~Client();	

	// Getters
	int 	GetClientID() 	{return clientID; };

#ifdef ONPC
	std::string GetClientName() {return clientName; };
#else
	String 		GetClientName() {return clientName; };
#endif

private:
	int clientID;
	int clientType;

#ifdef ONPC
	std::string clientName;
	std::string clientIP;
#else
	String clientName;
	String clientIP;
#endif

};