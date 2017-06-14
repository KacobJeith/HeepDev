#include "Arduino.h"

class Heep_Digital_Input
{
public:

	Heep_Digital_Input(int pinNumber, boolean pullUp = true);
	~Heep_Digital_Input() {};

	boolean ShouldToggle();
	int Read();

private:
	int mPrevState;
	int mPinNumber;
};

class Heep_Digital_Output
{
public:

	Heep_Digital_Output(int pinNumber, int defaultVal = 0);
	~Heep_Digital_Output() {};

	void Write(int value);

private:
	int mPinNumber;
};