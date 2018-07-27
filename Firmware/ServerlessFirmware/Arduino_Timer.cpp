#include "Arduino_Timer.h"
#include <Arduino.h>

uint64_t capturedRealTime = 0;
uint64_t millisRealTimeWasCaptured = 0;

unsigned long GetMillis()
{
	return millis();
}

// No absolute time yet
heepByte IsAbsoluteTime()
{
	if(capturedRealTime > 0)
		return 1;

	return 0;
}

uint64_t GetAnalyticsTime()
{
	if(IsAbsoluteTime())
	{
		// Calculate Analytics Time
		return capturedRealTime + (millis() - millisRealTimeWasCaptured);
	}
	else
	{
		return millis();
	}
}

void SetAnalyticsTime(uint64_t realTime)
{
	capturedRealTime = realTime;
	millisRealTimeWasCaptured = millis();
}