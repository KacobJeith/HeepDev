CC = g++
AR = ar

DEFINE_INDEXING = -DUSE_INDEXED_IDS
DEFINE_SYSTEM_TYPE = -DON_PC

all: libs

Device.o: ../../Device.cpp ../../Device.h
		$(CC) $(DEFINE_SYSTEM_TYPE) -c ../../Device.cpp

MemoryUtilities.o: ../../MemoryUtilities.cpp ../../MemoryUtilities.h
		$(CC) $(DEFINE_SYSTEM_TYPE) -c ../../MemoryUtilities.cpp

DeviceMemory.o: ../../DeviceMemory.cpp ../../DeviceMemory.h
		$(CC) $(DEFINE_SYSTEM_TYPE) -c ../../DeviceMemory.cpp

Heep_API.o: ../../Heep_API.cpp ../../Heep_API.h
		$(CC) $(DEFINE_SYSTEM_TYPE) -c ../../Heep_API.cpp

ActionAndResponseOpCodes.o: ../../ActionAndResponseOpCodes.cpp ../../ActionAndResponseOpCodes.h
		$(CC) $(DEFINE_SYSTEM_TYPE) -c ../../ActionAndResponseOpCodes.cpp

Scheduler.o: ../../Scheduler.cpp ../../Scheduler.h
		$(CC) $(DEFINE_SYSTEM_TYPE) -c ../../Scheduler.cpp

Socket_HeepComms.o: ../../Socket_HeepComms.cpp ../../Socket_HeepComms.h
		$(CC) $(DEFINE_SYSTEM_TYPE) -c ../../Socket_HeepComms.cpp

Simulation_NonVolatileMemory.o: ../../Simulation_NonVolatileMemory.cpp ../../Simulation_NonVolatileMemory.h
		$(CC) $(DEFINE_SYSTEM_TYPE) -c ../../Simulation_NonVolatileMemory.cpp

Simulation_Timer.o: ../../Simulation_Timer.cpp ../../Simulation_Timer.h
		$(CC) $(DEFINE_SYSTEM_TYPE) -c ../../Simulation_Timer.cpp

libHeep.a: Device.o MemoryUtilities.o DeviceMemory.o Heep_API.o ActionAndResponseOpCodes.o Scheduler.o#let's link library files into a static library
		$(AR) rcs libHeep.a Device.o MemoryUtilities.o DeviceMemory.o Heep_API.o ActionAndResponseOpCodes.o Scheduler.o

libSockHeep.a: Socket_HeepComms.o Simulation_NonVolatileMemory.o Simulation_Timer.o
		$(AR) rcs libSockHeep.a Socket_HeepComms.o Simulation_NonVolatileMemory.o Simulation_Timer.o

libs: libHeep.a libSockHeep.a

clean:
		rm -f myProgram *.o *.a *.gch *.d