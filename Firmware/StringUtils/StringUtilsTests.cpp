#include "StringUtils.h"
#include <iostream>

using namespace std;

int main(void)
{
	cout << "Tests Beginning" << endl;

	char testSet[10];
	ClearString(testSet, 10);
	testSet[0] = 'G';

	int counter = 1;
	WriteIntToString(1234567, testSet, counter);
	cout << "<" << testSet << ">" << endl;
	cout << counter << endl;

	char intString [] = ",,123";
	int crod = ParseIntFromSubString(intString, 2, 5);
	cout << crod << endl;

	char newTest[10];
	char testStr [] = "ABCDEFGHIJKLMNOP";
	ClearString(newTest, 10);
	CopySubstringToBuffer(newTest, testStr, 2, 6);
	cout << newTest << endl;

	return 0;
}