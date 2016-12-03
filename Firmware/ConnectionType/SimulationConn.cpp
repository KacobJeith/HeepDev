#include <iostream>

#include "SimulationConn.h"

SimulationConnection::SimulationConnection()
	: TCP_PORT(5000)
{}

SimulationConnection::~SimulationConnection()
{}

void SimulationConnection::Connect()
{
	PLCString theString("Test");
	std::cout << theString.GetString() << std::endl;
}

PLCString SimulationConnection::SendDataToServer(PLCString data)
{
	return data;
}