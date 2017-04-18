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