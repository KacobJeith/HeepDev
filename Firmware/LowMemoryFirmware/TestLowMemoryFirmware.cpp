#include <iostream>
#include "Client.h"

using namespace std;

int main(void)
{
	cout << "Begin Tests" << endl;

	CreateClientFromParams("Test", 1234, 1);

	cout << clientName << endl;

	return 0;
}