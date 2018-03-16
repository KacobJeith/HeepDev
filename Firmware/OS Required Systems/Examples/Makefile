CC = g++
STD = -std=c++11
LIBS = -lpthread -lHeep -lSockHeep
DEFINES = -DON_PC

LIBRARY_PATH = -L../../ServerlessFirmware/LibraryBuilders/Linux
INCLUDE_PATH = -I../../ServerlessFirmware

SimpleOutputExample.app : SimpleOutputExample.cpp
	$(CC) ${DEFINES} ${STD} ${LIBRARY_PATH} ${INCLUDE_PATH} $< -o $@ ${LIBS}