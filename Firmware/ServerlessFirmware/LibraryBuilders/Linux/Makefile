CC = g++
AR = ar

DEFINE_INDEXING = -DUSE_INDEXED_IDS
DEFINE_SIMULATION = -DSIMULATION

all: libs

Device.o: ../../Device.cpp ../../Device.h
		$(CC) $(DEFINE_SIMULATION) -c ../../Device.cpp

MemoryUtilities.o: ../../MemoryUtilities.cpp ../../MemoryUtilities.h
		$(CC) $(DEFINE_SIMULATION) -c ../../MemoryUtilities.cpp

DeviceMemory.o: ../../DeviceMemory.cpp ../../DeviceMemory.h
		$(CC) $(DEFINE_SIMULATION) -c ../../DeviceMemory.cpp

Heep_API.o: ../../Heep_API.cpp ../../Heep_API.h
		$(CC) $(DEFINE_SIMULATION) -c ../../Heep_API.cpp

ActionAndResponseOpCodes.o: ../../ActionAndResponseOpCodes.cpp ../../ActionAndResponseOpCodes.h
		$(CC) $(DEFINE_SIMULATION) -c ../../ActionAndResponseOpCodes.cpp

Scheduler.o: ../../Scheduler.cpp ../../Scheduler.h
		$(CC) $(DEFINE_SIMULATION) -c ../../Scheduler.cpp

Simulation_HeepComms.o: ../../Simulation_HeepComms.cpp ../../Simulation_HeepComms.h
		$(CC) $(DEFINE_SIMULATION) -c ../../Simulation_HeepComms.cpp

Simulation_NonVolatileMemory.o: ../../Simulation_NonVolatileMemory.cpp ../../Simulation_NonVolatileMemory.h
		$(CC) $(DEFINE_SIMULATION) -c ../../Simulation_NonVolatileMemory.cpp

Simulation_Timer.o: ../../Simulation_Timer.cpp ../../Simulation_Timer.h
		$(CC) $(DEFINE_SIMULATION) -c ../../Simulation_Timer.cpp

libHeep.a: Device.o MemoryUtilities.o DeviceMemory.o Heep_API.o ActionAndResponseOpCodes.o Scheduler.o#let's link library files into a static library
		$(AR) rcs libHeep.a Device.o MemoryUtilities.o DeviceMemory.o Heep_API.o ActionAndResponseOpCodes.o Scheduler.o

libSimHeep.a: Simulation_HeepComms.o Simulation_NonVolatileMemory.o Simulation_Timer.o
		$(AR) rcs libSimHeep.a Simulation_HeepComms.o Simulation_NonVolatileMemory.o Simulation_Timer.o

libs: libHeep.a libSimHeep.a

clean:
		rm -f myProgram *.o *.a *.gch *.d