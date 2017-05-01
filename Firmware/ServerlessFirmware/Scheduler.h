#include "globalDefines.h"

unsigned long lastMillis = 0;
unsigned char tasks[NUMBER_OF_TASKS];
unsigned char curNumberOfTasks = 0;
unsigned char curTaskCounter = 0;

unsigned long taskInterval = 0;

void ScheduleTask(int taskID)
{
	tasks[curNumberOfTasks] = taskID;
	curNumberOfTasks++;

	taskInterval = SYSTEM_TASK_INTERVAL/curNumberOfTasks;
}


// Perform Round Robin Scheduling
unsigned char IsTaskTime()
{
	if(yes)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

unsigned char GetCurrentTask()
{
	curTaskCounter++;

	if(curTaskCounter >= curNumberOfTasks)
		curTaskCounter = 0;

	return tasks[curTaskCounter];
}