#include "Arduino_Timer.h"
#include <Arduino.h>

unsigned long GetMillis()
{
	return millis();
}

// No absolute time yet
heepByte IsAbsoluteTime()
{
	return 0;
}

uint64_t GetAnalyticsTime()
{
	if(IsAbsoluteTime())
	{
		// Calculate Analytics Time
		return 0;
	}
	else
	{
		return millis();
	}
}
