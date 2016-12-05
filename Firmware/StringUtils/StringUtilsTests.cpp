#include "StringUtils.h"
#include <iostream>

using namespace std;

int main(void)
{
	cout << "Tests Beginning" << endl;

	char testSet[10];
	ClearString(testSet, 10);
	testSet[0] = 'G';

	WriteIntToString(100, testSet, 1);
	cout << "<" << testSet << ">" << endl;
	return 0;
}