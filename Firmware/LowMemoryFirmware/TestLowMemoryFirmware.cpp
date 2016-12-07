#include <iostream>
#include "Client.h"

using namespace std;

int main(void)
{
	cout << "Begin Tests" << endl;

	ClearString(clientName, CLIENT_NAME_MEMORY_SIZE);
	CopyStringToBuffer(clientName, "Hello");

	cout << clientName << endl;

	return 0;
}