#ifndef CONN_INTF
#define CONN_INTF

#include "../PLCString/PLCString.h"

class ConnectionInterface
{
public:
	ConnectionInterface() {};
	virtual ~ConnectionInterface() {};

	virtual void Connect() = 0;

	virtual PLCString SendDataToServer(PLCString data) = 0;
};

#endif