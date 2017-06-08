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