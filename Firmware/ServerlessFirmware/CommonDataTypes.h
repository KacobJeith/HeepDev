// The heepByte is our standard 8bit unit that we will work with
typedef unsigned char heepByte;

// Define the input and output buffers for global accessibility
unsigned char outputBuffer [OUTPUT_BUFFER_SIZE];
unsigned int outputBufferLastByte = 0;

unsigned char inputBuffer [INPUT_BUFFER_SIZE];
unsigned int inputBufferLastByte = 0;

struct HeepIPAddress
{
	unsigned char Octet4;
	unsigned char Octet3;
	unsigned char Octet2;
	unsigned char Octet1;
};

struct Vertex
{
	unsigned long rxID;
	unsigned long txID;

	unsigned char rxControlID;
	unsigned char txControlID;

	struct HeepIPAddress rxIPAddress;
};

struct Vertex_Byte
{
	heepByte rxID [STANDARD_ID_SIZE];
	heepByte txID [STANDARD_ID_SIZE];

	unsigned char rxControlID;
	unsigned char txControlID;

	struct HeepIPAddress rxIPAddress;
};

struct Control
{
	unsigned char controlID;
	unsigned char controlDirection;
	unsigned char controlType;
	unsigned char highValue;
	unsigned char lowValue;
	unsigned char curValue;
	unsigned char controlFlags;
	char* controlName;
};