#include "ControlValue.h"

ControlValue::ControlValue()
{

}

ControlValue::ControlValue(char* name, ControlDirectionType direction, ControlType cType)
	: controlName(name)
	, controlDirection(direction)
	, type(cType)
{
}

ControlValue::~ControlValue()
{

}