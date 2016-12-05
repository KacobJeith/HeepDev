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

#ifdef ONPC
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

void ClearString(char* curString, int bufferLen)
{
	for(int i = 0; i < bufferLen; i++)
	{
		curString[i] = '\0';
	}
}

int GetStringLength(char* str)
{
	int counter = 0;
	while(1)
	{
		if(str[counter] == '\0')
			break;
		counter++;
	}

	return counter;
}

void CopyStringToBuffer(char* dest, char* src)
{
	int strSize = GetStringLength(src);

	for(int i = 0; i < strSize; i++)
	{
		dest[i] = src[i];
	}
}

ControlValue::ControlValue(char* name, ControlDirectionType direction, ControlType cType)
	: controlDirection(direction)
	, type(cType)
	, highValue(10)
	, lowValue(0)
{
	ClearString(controlName, CONTROL_VAL_NAME_BUFFER_LEN);
	CopyStringToBuffer(controlName, name);
}

ControlValue::ControlValue(char* controlValString)
{
	//SetControlFromString(controlValString);
}
#endif

ControlValue::~ControlValue()
{

}

#ifdef ONPC

std::string ControlValue::GetControlString()
{
	std::string ctrlString = std::to_string(controlDirection) + "," + std::to_string(type) + "," + controlName + "," + std::to_string(lowValue) + "," + std::to_string(highValue);
	return ctrlString;
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
	controlDirection = (ControlDirectionType) std::stoi(DirectionStr.c_str());
	type = (ControlType) std::stoi(TypeStr.c_str());
	lowValue = std::stoi(LowValStr.c_str());
	highValue = std::stoi(HighValStr.c_str());
}

#else

char* ControlValue::GetControlString()
{
	//String ctrlString = String(controlDirection) + "," + String(type) + "," + controlName + "," + String(lowValue) + "," + String(highValue);
	return "Test";
}

void SetControlFromString(char* controlString)
{

}

#endif