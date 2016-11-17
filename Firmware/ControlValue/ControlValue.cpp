#include "ControlValue.h"

ControlValList::ControlValList(int numElements)
	: currentMaxElement(0)
{
	ctrlValArray = new ControlValue[numElements];
}

ControlValList::~ControlValList()
{
}

void ControlValList::AddControlValToList(ControlValue ctrlVal)
{
	ctrlValArray[currentMaxElement] = ctrlVal;
	currentMaxElement++;
}

ControlValue::ControlValue()
{

}

#ifdef TESTING
ControlValue::ControlValue(std::string name, ControlDirectionType direction, ControlType cType)
	: controlName(name)
	, controlDirection(direction)
	, type(cType)
	, highValue(10)
	, lowValue(0)
{
}
#else
ControlValue::ControlValue(String name, ControlDirectionType direction, ControlType cType)
	: controlName(name)
	, controlDirection(direction)
	, type(cType)
	, highValue(10)
	, lowValue(0)
{
}
#endif

ControlValue::~ControlValue()
{

}

#ifdef TESTING

std::string ControlValue::GetControlString()
{
	std::string ctrlString = std::to_string(controlDirection) + "," + std::to_string(type) + "," + controlName + "," + std::to_string(lowValue) + "," + std::to_string(highValue);
	return ctrlString;
}

#else

String ControlValue::GetControlString()
{
	return "Test";
}

#endif