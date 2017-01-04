#include "StringUtils.h"

void ConnectToPLCServer()
{

}

void SendDataToPLCServer(char* outputBuffer, char* inputBuffer)
{	

}

void SendDataToPLCClient(char* outputBuffer, char* inputBuffer, char* destIP)
{
	// Get DestIP Ints
	int length = GetStringLength(destIP);

	int octetOne = 0;
	int octetTwo = 0;
	int octetThree = 0;
	int octetFour = 0;

	int octetNumber = 0;
	int lastDot = 0;

	for(int i = 0; i < length; i++)
	{
		if(destIP[i] == '.')
		{
			if(octetNumber == 0)
			{
				octetOne = ParseIntFromSubString(destIP, 0, i);
				octetNumber++;
				lastDot = i;
			}
			else if(octetNumber == 1)
			{
				octetTwo = ParseIntFromSubString(destIP, lastDot+1, i);
				octetNumber++;
				lastDot = i;
			}
			else if(octetNumber == 2)
			{
				octetThree = ParseIntFromSubString(destIP, lastDot+1, i);
				octetNumber++;
				lastDot = i;
			}

		}
	}

	octetFour = ParseIntFromSubString(destIP, lastDot+1, length);

}