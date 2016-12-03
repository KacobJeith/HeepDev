#include "ConnectionInterface.h"

class ENC28J60Connection : public ConnectionInterface
{
public:
	ENC28J60Connection();
	virtual ~ENC28J60Connection();

	virtual void Connect();

	virtual PLCString SendDataToServer(PLCString data)

private:
	int TCP_PORT;
};