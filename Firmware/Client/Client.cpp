#include "Client.h"

Client::Client()
	: controlValueList(0)
{

}

#ifdef ONPC
Client::Client(int ID, std::string name, int numControls)
	: clientID(ID)
	, clientName(name)
	, clientType(0)
	, clientIP("None")
	, controlValueList(numControls)
{
}

#else
Client::Client(int ID, String name, int numControls)
	: clientID(ID)
	, clientName(name)
	, clientType(0)
	, clientIP("None")
	, controlValueList(numControls)
{
}

#endif

Client::~Client()
{

}