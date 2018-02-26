CC = ~/library/Arduino15/packages/esp8266/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/bin/xtensa-lx106-elf-g++
AR = ~/library/Arduino15/packages/esp8266/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/bin/xtensa-lx106-elf-ar
# CC = g++
# AR = ar
DEFINE_INDEXING = -DUSE_INDEXED_IDS
DEFINE_SIMULATION = -DSIMULATION

PREPROCESSORFLAGS = -D__ets__ -DICACHE_FLASH -U__STRICT_ANSI__ 
COMPILERFLAGS = -c -w -Os -g -mlongcalls -mtext-section-literals -fno-exceptions -fno-rtti -falign-functions=4 -std=c++11 -MMD -ffunction-sections -fdata-sections -DF_CPU=80000000L -DLWIP_OPEN_SRC -DTCP_MSS=536   -DARDUINO=10803 -DARDUINO_ESP8266_ESP12 -DARDUINO_ARCH_ESP8266 -DARDUINO_BOARD="ESP8266_ESP12"  -DESP8266

all: libs

Device.o: ../../Device.c ../../Device.h
		$(CC) $(PREPROCESSORFLAGS) $(COMPILERFLAGS) $(DEFINE_SIMULATION) -c ../../Device.c

MemoryUtilities.o: ../../MemoryUtilities.c ../../MemoryUtilities.h
		$(CC) $(PREPROCESSORFLAGS) $(COMPILERFLAGS) $(DEFINE_SIMULATION) -c ../../MemoryUtilities.c

DeviceMemory.o: ../../DeviceMemory.c ../../DeviceMemory.h
		$(CC) $(PREPROCESSORFLAGS) $(COMPILERFLAGS) $(DEFINE_SIMULATION) -c ../../DeviceMemory.c

Heep_API.o: ../../Heep_API.c ../../Heep_API.h
		$(CC) $(PREPROCESSORFLAGS) $(COMPILERFLAGS) $(DEFINE_SIMULATION) -c ../../Heep_API.c

ActionAndResponseOpCodes.o: ../../ActionAndResponseOpCodes.c ../../ActionAndResponseOpCodes.h
		$(CC) $(PREPROCESSORFLAGS) $(COMPILERFLAGS) $(DEFINE_SIMULATION) -c ../../ActionAndResponseOpCodes.c

Scheduler.o: ../../Scheduler.c ../../Scheduler.h
		$(CC) $(PREPROCESSORFLAGS) $(COMPILERFLAGS) $(DEFINE_SIMULATION) -c ../../Scheduler.c

Simulation_HeepComms.o: ../../Simulation_HeepComms.c ../../Simulation_HeepComms.h
		$(CC) $(PREPROCESSORFLAGS) $(COMPILERFLAGS) $(DEFINE_SIMULATION) -c ../../Simulation_HeepComms.c

Simulation_NonVolatileMemory.o: ../../Simulation_NonVolatileMemory.c ../../Simulation_NonVolatileMemory.h
		$(CC) $(PREPROCESSORFLAGS) $(COMPILERFLAGS) $(DEFINE_SIMULATION) -c ../../Simulation_NonVolatileMemory.c

Simulation_Timer.o: ../../Simulation_Timer.c ../../Simulation_Timer.h
		$(CC) $(PREPROCESSORFLAGS) $(COMPILERFLAGS) $(DEFINE_SIMULATION) -c ../../Simulation_Timer.c

libHeep.a: Device.o MemoryUtilities.o DeviceMemory.o Heep_API.o ActionAndResponseOpCodes.o Scheduler.o#let's link library files into a static library
		$(AR) rcs libHeep.a Device.o MemoryUtilities.o DeviceMemory.o Heep_API.o ActionAndResponseOpCodes.o Scheduler.o

libSimHeep.a: Simulation_HeepComms.o Simulation_NonVolatileMemory.o Simulation_Timer.o
		$(AR) rcs libSimHeep.a Simulation_HeepComms.o Simulation_NonVolatileMemory.o Simulation_Timer.o

libs: libHeep.a libSimHeep.a

clean:
		rm -f myProgram *.o *.a *.gch *.d