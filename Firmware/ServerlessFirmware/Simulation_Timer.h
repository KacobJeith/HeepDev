#pragma once
#include "CommonDataTypes.h"
#include <stdint.h>

extern uint64_t simMillis;
unsigned long GetMillis();
// No absolute time yet
heepByte IsAbsoluteTime();
uint64_t GetAnalyticsTime();