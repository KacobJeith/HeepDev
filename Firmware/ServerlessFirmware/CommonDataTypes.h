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

	HeepIPAddress rxIPAddress;
};

struct Vertex_Byte
{
	heepByte rxID [STANDARD_ID_SIZE];
	heepByte txID [STANDARD_ID_SIZE];

	unsigned char rxControlID;
	unsigned char txControlID;

	HeepIPAddress rxIPAddress;
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