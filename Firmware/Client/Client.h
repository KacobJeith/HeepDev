#include "../Utilities/GlobalDefines.h"
#include "../ControlValue/ControlValue.h"

#ifdef ONPC
#include <string>
#endif

class Client {
public:
	Client();

#ifdef ONPC
	Client(int ID, std::string name, int numControls);
#else
	Client(int ID, String name, int numControls)
#endif
	~Client();	

	// Setters


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
	ControlValList controlValueList;

#ifdef ONPC
	std::string clientName;
	std::string clientIP;
#else
	String clientName;
	String clientIP;
#endif

};