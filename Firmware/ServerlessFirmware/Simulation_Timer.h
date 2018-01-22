#include <stdint.h>

uint64_t simMillis = 0;
unsigned long GetMillis()
{
	simMillis++;
	return simMillis;
}

heepByte GetNumBytesForCurrentTime()
{
	heepByte numBytes = 0;
	while( (simMillis >> numBytes*8) > 0)
	{
		numBytes++;
	}

	return numBytes;
}