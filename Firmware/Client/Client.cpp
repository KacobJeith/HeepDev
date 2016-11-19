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

#ifdef ONPC

std::string Client::GetClientString()
{
	std::string retString = std::to_string(clientID) + "," + clientIP + "," + std::to_string(clientType) + "," + clientName;

	for(int i = 0; i < controlValueList.GetMaxElementIndex(); i++)
	{
		retString += "," + controlValueList.GetControlAtIndex(i).GetControlString();
	}

	return retString;
}

#else

String Client::GetClientString()
{
	return "Test";
}

#endif