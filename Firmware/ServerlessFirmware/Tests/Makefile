CC = g++
DEFINE_INDEXING = -DUSE_INDEXED_IDS

all: TestFirmwareIndexing.app TestFirmwareUnIndexed.app

TestFirmwareIndexing.app : TestServerlessFirmware.cpp
	$(CC) $(DEFINE_INDEXING) ../MemoryUtilities.c ../DeviceMemory.c ../Device.c $< -o $@

TestFirmwareUnIndexed.app : TestServerlessFirmware.cpp
	$(CC) ../MemoryUtilities.c ../DeviceMemory.c ../Device.c $< -o $@