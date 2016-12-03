#include <iostream>
#include "ClientConnection.h"
#include "ConnectionType/SimulationConn.h"

using namespace std;

void TestClientLoad()
{
	SimulationConnection* simConn = new SimulationConnection();
	Client forge(1232, "Crack", 3);
	ClientConnection conn(forge, simConn);
	conn.GetVerticesFromServer();
	cout << "Asshole" << endl;
}

int main(void)
{
	cout << "Begin Test" << endl;
	TestClientLoad();

	return 0;
}