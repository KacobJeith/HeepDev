#include "StringUtils.h"

void ClearString(char* curString, int bufferLen)
{
	for(int i = 0; i < bufferLen; i++)
	{
		curString[i] = '\0';
	}
}

int GetStringLength(char* str)
{
	int counter = 0;
	while(1)
	{
		if(str[counter] == '\0')
			break;
		counter++;
	}

	return counter;
}

void CopyStringToBuffer(char* dest, char* src)
{
	int strSize = GetStringLength(src);

	for(int i = 0; i < strSize; i++)
	{
		dest[i] = src[i];
	}
}

void WriteIntToString(int number, char* dest, int startPoint)
{
	int numDigits = 1;
	int counter = 10;
	while(number >= counter)
	{
		counter *= 10;
		numDigits++;
	}

	int moduloNum = 1;
	for(int i = 0; i < numDigits; i++)
		moduloNum *= 10;

	for(int i = 0; i < numDigits; i++)
	{
		dest[startPoint] = ( (number%moduloNum) / (moduloNum/10) ) + '0';
		startPoint++;
		moduloNum = moduloNum/10;
	}
}