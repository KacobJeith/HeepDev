#include "ClientConnection.h"
#include "Utilities/globalDefines.h"
#include "ConnectionType/SimulationConn.h"

#ifdef ONPC
#include <iostream>
using namespace std;

void TestClientLoad()
{
	SimulationConnection* simConn = new SimulationConnection();
	Client* forge = new Client(1232, "Crack", 3);
	ControlValue* ctrlVal = new ControlValue("Test Output", ControlValue::output, ControlValue::Range);
	forge->AddControlToClient(ctrlVal);
	cout << forge->GetClientString() << endl;

	ClientConnection conn(forge, simConn);
	conn.GetVerticesFromServer();
}

int main(void)
{
	cout << "Begin Test" << endl;
	TestClientLoad();

	return 0;
}
#endif