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
	return 0;
}