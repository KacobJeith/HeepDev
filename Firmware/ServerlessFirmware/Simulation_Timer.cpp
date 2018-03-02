#include "Simulation_Timer.h"

uint64_t simMillis = 0;
unsigned long GetMillis()
{
	simMillis++;
	return simMillis;
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
		return simMillis;
	}
}
