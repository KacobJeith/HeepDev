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

ControlValue::ControlValue(std::string controlValString)
{
	SetControlFromString(controlValString);
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

ControlValue::ControlValue(String controlValString)
{
	SetControlFromString(controlValString);
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

std::string GetStrInRange(std::string controlString, int index1, int index2)
{

}

void ControlValue::SetControlFromString(std::string controlString)
{
	enum parseState {parseDirection, parseType, parseName, parseLowHighVal};

	parseState curState = parseDirection;

	std::string DirectionStr, TypeStr, NameStr, LowValStr, HighValStr;
	int directionIndex, typeIndex, nameIndex, lowValIndex, highValIndex;

	for(int i = 0; i<controlString.size(); i++)
	{
		char curChar = controlString[i];
		
		if(curChar == ',')
		{
			if(curState == parseDirection)
			{
				directionIndex = i;
				DirectionStr = controlString.substr(0, directionIndex);
				curState = parseType;
			}
			else if(curState == parseType)
			{
				typeIndex = i;
				TypeStr = controlString.substr(directionIndex+1, typeIndex-(directionIndex+1));
				curState = parseName;
			}
			else if(curState == parseName)
			{
				nameIndex = i;
				NameStr = controlString.substr(typeIndex+1, nameIndex-(typeIndex+1));
				curState = parseLowHighVal;
			}
			else if(curState == parseLowHighVal)
			{
				lowValIndex = i;
				LowValStr = controlString.substr(nameIndex+1, lowValIndex-(nameIndex+1));
				HighValStr = controlString.substr(lowValIndex+1, controlString.size()-(lowValIndex+1));
				break;
			}
		}
	}
	
	controlName = NameStr;
	controlDirection = (ControlDirectionType) std::atoi(DirectionStr.c_str());
	type = (ControlType) std::atoi(TypeStr.c_str());
	lowValue = std::atoi(LowValStr.c_str());
	highValue = std::atoi(HighValStr.c_str());
}

#else

String ControlValue::GetControlString()
{
	return "Test";
}

void SetControlFromString(String controlString)
{

}

#endif