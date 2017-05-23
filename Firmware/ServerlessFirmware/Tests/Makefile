CC = g++

all: clean TestFirmware.app

TestFirmware.app : TestServerlessFirmware.cpp
	$(CC) $< -o $@

clean:
	rm TestFirmware.app