#include "Heep_Digital.h"

Heep_Digital_Input::Heep_Digital_Input(int pinNumber, boolean pullUp)
	: mPrevState(0)
	, mPinNumber(pinNumber)
{
	pinMode(mPinNumber, INPUT);

	if(pullUp)
	{
		digitalWrite(mPinNumber, HIGH);
	}
}

boolean Heep_Digital_Input::ShouldToggle()
{
	int curState = digitalRead(mPinNumber);

	if(curState != mPrevState)
	{
		mPrevState = curState;
		return true;
	}

	return false;
}

int Heep_Digital_Input::Read()
{
	return digitalRead(mPinNumber);
}