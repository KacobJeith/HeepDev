#include "ConnectionInterface.h"

class SimulationConnection : public ConnectionInterface
{
public:
	SimulationConnection();
	virtual ~SimulationConnection();

	virtual void Connect();

	virtual PLCString SendDataToServer(PLCString data);

private:
	int TCP_PORT;
};