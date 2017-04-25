#include "TestDynamicMemory.h"
#include "TestActionAndResponseOpCodes.h"

int main(void) 
{
	cout << "Begin Tests" << endl;

	TestDynamicMemory();
	TestActionAndResponseOpCodes();

	return 0;
}