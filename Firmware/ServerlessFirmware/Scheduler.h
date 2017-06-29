#include "globalDefines.h"

#ifdef ON_PC
#include "Simulation_Timer.h"
#endif

#ifdef ON_ARDUINO
#include "Arduino_Timer.h"
#endif

#ifdef SIMULATION
#include "Simulation_Timer.h"
#endif

#ifdef ON_PIC
#include "PICW5500_Timer.h"
#endif

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