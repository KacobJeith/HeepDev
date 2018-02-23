CC = gcc

DEFINE_SIMULATION = -DSIMULATION

TestC.app : CTest.c
	$(CC) $(DEFINE_INDEXING) $(DEFINE_SIMULATION) ../../Heep_API.c ../../Simulation_HeepComms.c ../../Simulation_NonVolatileMemory.c ../../Scheduler.c ../../MemoryUtilities.c ../../DeviceMemory.c ../../Device.c ../../ActionAndResponseOpCodes.c ../../Simulation_Timer.c $< -o $@
