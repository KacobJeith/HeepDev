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
{
}
#else
ControlValue::ControlValue(String name, ControlDirectionType direction, ControlType cType)
	: controlName(name)
	, controlDirection(direction)
	, type(cType)
{
}
#endif

ControlValue::~ControlValue()
{

}