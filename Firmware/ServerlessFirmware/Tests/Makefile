CC = g++
DEFINE_INDEXING = -DUSE_INDEXED_IDS
DEFINE_SIMULATION = -DSIMULATION

#all: TestFirmwareIndexing.app TestFirmwareUnIndexed.app
#
#TestFirmwareIndexing.app : TestServerlessFirmware.cpp
#	$(CC) $(DEFINE_INDEXING) $(DEFINE_SIMULATION) ../Heep_API.c ../Simulation_NonVolatileMemory.c ../Simulation_HeepComms.c ../Scheduler.c ../MemoryUtilities.c ../DeviceMemory.c ../Device.c ../ActionAndResponseOpCodes.c ../Simulation_Timer.c $< -o $@
#
#TestFirmwareUnIndexed.app : TestServerlessFirmware.cpp
#	$(CC) $(DEFINE_SIMULATION) ../Heep_API.c ../Simulation_HeepComms.c ../Simulation_NonVolatileMemory.c ../Scheduler.c ../MemoryUtilities.c ../DeviceMemory.c ../Device.c ../ActionAndResponseOpCodes.c ../Simulation_Timer.c $< -o $@

all: myProgram

myProgram: TestServerlessFirmware.o libHeep.a libSimHeep.a#libmylib.a is the dependency for the executable
		$(CC) $(DEFINE_SIMULATION) -lm -o myProgram TestServerlessFirmware.o -L. -lHeep -lSimHeep

TestServerlessFirmware.o: TestServerlessFirmware.cpp
		$(CC) $(DEFINE_SIMULATION) -O -c TestServerlessFirmware.cpp

Device.o: ../Device.c ../Device.h
		$(CC) $(DEFINE_SIMULATION) -O -c ../Device.c

MemoryUtilities.o: ../MemoryUtilities.c ../MemoryUtilities.h
		$(CC) $(DEFINE_SIMULATION) -O -c ../MemoryUtilities.c

DeviceMemory.o: ../DeviceMemory.c ../DeviceMemory.h
		$(CC) $(DEFINE_SIMULATION) -O -c ../DeviceMemory.c

Heep_API.o: ../Heep_API.c ../Heep_API.h
		$(CC) $(DEFINE_SIMULATION) -O -c ../Heep_API.c

ActionAndResponseOpCodes.o: ../ActionAndResponseOpCodes.c ../ActionAndResponseOpCodes.h
		$(CC) $(DEFINE_SIMULATION) -O -c ../ActionAndResponseOpCodes.c

Scheduler.o: ../Scheduler.c ../Scheduler.h
		$(CC) $(DEFINE_SIMULATION) -O -c ../Scheduler.c

Simulation_HeepComms.o: ../Simulation_HeepComms.c ../Simulation_HeepComms.h
		$(CC) $(DEFINE_SIMULATION) -O -c ../Simulation_HeepComms.c

Simulation_NonVolatileMemory.o: ../Simulation_NonVolatileMemory.c ../Simulation_NonVolatileMemory.h
		$(CC) $(DEFINE_SIMULATION) -O -c ../Simulation_NonVolatileMemory.c

Simulation_Timer.o: ../Simulation_Timer.c ../Simulation_Timer.h
		$(CC) $(DEFINE_SIMULATION) -O -c ../Simulation_Timer.c

libHeep.a: TestServerlessFirmware.o Device.o MemoryUtilities.o DeviceMemory.o Heep_API.o ActionAndResponseOpCodes.o Scheduler.o#let's link library files into a static library
		ar rcs libHeep.a TestServerlessFirmware.o Device.o MemoryUtilities.o DeviceMemory.o Heep_API.o ActionAndResponseOpCodes.o Scheduler.o

libSimHeep.a: Simulation_HeepComms.o Simulation_NonVolatileMemory.o Simulation_Timer.o
		ar rcs libSimHeep.a Simulation_HeepComms.o Simulation_NonVolatileMemory.o Simulation_Timer.o

libs: libHeep.a libSimHeep.a

clean:
		rm -f myProgram *.o *.a *.gch 