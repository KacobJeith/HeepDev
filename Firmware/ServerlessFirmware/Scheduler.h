#include "ActionAndResponseOpCodes.h"

extern unsigned long lastMillis;
extern unsigned char tasks[];
extern unsigned char curNumberOfTasks;
extern unsigned char curTaskCounter;
 
extern unsigned long taskInterval;

void ScheduleTask(int taskID);
unsigned char IsTaskTime();
unsigned char GetCurrentTask();