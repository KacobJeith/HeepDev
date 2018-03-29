#include <iostream>
#include <Heep_API.h>

heepByte deviceIDByte [STANDARD_ID_SIZE] = {0x0,0x1d,0xfd,0x8d};
uint8_t mac[6] = {0x61,0x4f,0xe,0x6c,0x53,0x45};
unsigned char clearMemory = 1;

using namespace std;

int main(void)
{
	cout << "Start Heep" << endl;
	
	AddOnOffControl("Hello", HEEP_INPUT, 0);
  	AddOnOffControl("Bye", HEEP_OUTPUT, 1);
  	AddRangeControl("MyRange", HEEP_INPUT, 100, 20, 50);

  	StartHeep("ExperimentUsability", HEEP_ICON_CUCKOO_CLOCK);

	while(1)
	{
		PerformHeepTasks();
	}

	return 0;
}
