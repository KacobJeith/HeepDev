// Overall Version of the Firmware. This is reported so that
// front Ends are able to translate or determine that they don't
// understand a certain device
#define FIRMWARE_VERSION 1

// Pin that will clear all memory on the device so that only core 
// memory remains
#define FACTORY_RESET_PIN 4

// Setting this define will compile the HEEP OS with built-in Analytics
//#define USE_ANALYTICS

// Memory Allocation. These numbers are actually device specific, 
// but they require more research to nail down the exact numbers
// for each device
#define MAX_MEMORY 1500			// Bytes
#define NUM_VERTICES 200		// Vertex Pointers
#define NUM_CONTROLS 100		// Control Pointers
#define OUTPUT_BUFFER_SIZE 1500	// Bytes
#define INPUT_BUFFER_SIZE 200	// Bytes

// Heep OS Task Scheduling System
// Determine how frequently a task is run and how many tasks can be made
#define SYSTEM_TASK_INTERVAL 1000 // Time in ms
#define NUMBER_OF_TASKS 4

// Indexed IDs are a form of compression that can be used
// on memory limited devices. These are particularly useful
// When using IDs that are very long strings
//#define USE_INDEXED_IDS

#ifdef USE_INDEXED_IDS
#define ID_SIZE 1
#else 
#define ID_SIZE STANDARD_ID_SIZE
#endif