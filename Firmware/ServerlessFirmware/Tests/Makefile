CC = g++
DEFINE_INDEXING = -DUSE_INDEXED_IDS
DEFINE_SIMULATION = -DSIMULATION

all: TestFirmwareIndexing.app TestFirmwareUnIndexed.app

TestFirmwareIndexing.app : TestServerlessFirmware.cpp
	$(CC) $(DEFINE_INDEXING) $(DEFINE_SIMULATION) ../Heep_API.c ../Simulation_NonVolatileMemory.c ../Simulation_HeepComms.c ../Scheduler.c ../MemoryUtilities.c ../DeviceMemory.c ../Device.c ../ActionAndResponseOpCodes.c ../Simulation_Timer.c $< -o $@

TestFirmwareUnIndexed.app : TestServerlessFirmware.cpp
	$(CC) $(DEFINE_SIMULATION) ../Heep_API.c ../Simulation_HeepComms.c ../Simulation_NonVolatileMemory.c ../Scheduler.c ../MemoryUtilities.c ../DeviceMemory.c ../Device.c ../ActionAndResponseOpCodes.c ../Simulation_Timer.c $< -o $@