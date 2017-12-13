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

	if(GetMillis() - lastMillis > taskInterval)
	{
		lastMillis = GetMillis();
		return 1;
	}
	else if( lastMillis > GetMillis() )
	{
		lastMillis = 0; // Up to one Task interval of error may be introduced, but that is no issue for current scheduling
	}

	return 0;
}

unsigned char GetCurrentTask()
{
	curTaskCounter++;

	if(curTaskCounter >= curNumberOfTasks)
		curTaskCounter = 0;

	return tasks[curTaskCounter];
}