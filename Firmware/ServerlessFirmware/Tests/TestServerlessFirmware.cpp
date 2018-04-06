#include "TestDynamicMemory.h"
#include "TestActionAndResponseOpCodes.h"
#include "TestAPI.h"

unsigned char clearMemory = 1;
heepByte deviceIDByte [STANDARD_ID_SIZE] = {0x01, 0x02, 0x33, 0x04};
uint8_t mac[6] = {0x01,0x02,0x03,0x04,0x45,0x06};
heepByte base64DeviceIDByte [STANDARD_ID_SIZE_BASE_64];

int main(void) 
{
	cout << "Begin Tests" << endl;

	TestDynamicMemory();
	TestActionAndResponseOpCodes();
	TestHeepAPI();

	return 0;
}