#define SIMULATION
#include "TestDynamicMemory.h"
#include "TestActionAndResponseOpCodes.h"
#include "TestAPI.h"

int main(void) 
{
	cout << "Begin Tests" << endl;

	TestDynamicMemory();
	TestActionAndResponseOpCodes();

	return 0;
}