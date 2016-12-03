#include "ConnectionInterface.h"

class SimulationConnection
{
public:
	SimulationConnection();
	virtual ~SimulationConnection();

	virtual void Connect();

private:
	int TCP_PORT;
};