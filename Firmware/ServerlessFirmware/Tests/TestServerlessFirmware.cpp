#include "TestDynamicMemory.h"
#include "TestActionAndResponseOpCodes.h"
#include "TestAPI.h"

heepByte deviceIDByte [STANDARD_ID_SIZE] = {0x01, 0x02, 0x33, 0x04};
uint8_t mac[6] = {0x01,0x02,0x03,0x04,0x45,0x06};

int main(void) 
{
	cout << "Begin Tests" << endl;

	TestDynamicMemory();
	TestActionAndResponseOpCodes();
	TestHeepAPI();

	return 0;
}