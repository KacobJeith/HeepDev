#include <iostream>
#include "SimulationConn.h"

using namespace std;

int main(void)
{
	cout << "Tests Beginning" << endl;

	ConnectionInterface* conn;
	conn = new SimulationConnection();
	conn->Connect();

	PLCString myString("Touch");
	PLCString newString = conn->SendDataToServer(myString);

	cout << newString.GetString() << endl;
}