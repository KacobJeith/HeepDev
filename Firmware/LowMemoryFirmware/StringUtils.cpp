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
		if(str[counter] == '\0' || str[counter] == '\r' || str[counter] == '\n')
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

void WriteIntToString(int number, char* dest, int &startPoint)
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

void CopyStringToBufferAtPos(char* dest, char* src, int &startPoint)
{
	int stringLen = GetStringLength(src);

	for(int i = 0; i < stringLen; i++)
	{
		dest[startPoint] = src[i];
		startPoint++;
	}
}

int ParseIntFromSubString(char* str, int start, int end)
{
	int retVal = 0;
	int numDigits = end - start - 1;
	int multiplier = 1;

	for(int i = 0; i < numDigits; i++)
		multiplier *= 10;

	for(int i = start; i < end; i++)
	{
		retVal += multiplier * (str[i] - '0');
		multiplier = multiplier / 10;
	}

	return retVal;
}

void CopySubstringToBuffer(char* dest, char* src, int start, int end)
{
	for(int i = start; i < end; i++)
	{
		dest[i-start] = src[i];
	}
}

int CheckStringEquality(char* str1, char* str2)
{
	int strSize = GetStringLength(str1);
	if(GetStringLength(str2) != strSize)
		return 0;

	for(int i = 0; i < strSize; i++)
	{
		if(str1[i] != str2[i])
			return 0;
	}

	return 1;
}