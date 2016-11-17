#include "Client.h"

Client::Client()
{

}

#ifdef ONPC
Client::Client(int ID, std::string name)
	: clientID(ID)
	, clientName(name)
	, clientType(0)
	, clientIP("None")
{
}

#else
Client::Client(int ID, String name)
	: clientID(ID)
	, clientName(name)
	, clientType(0)
	, clientIP("None")
{
}

#endif

Client::~Client()
{

}