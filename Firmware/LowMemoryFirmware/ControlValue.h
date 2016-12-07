#include "GlobalPreprocessor.h"
#include "../StringUtils/StringUtils.h"

struct ControlValue
{
	char controlName[CONTROL_NAME_MEMORY_SIZE];
	char direction;
	char type;
	char highLim;
	char lowLim;
	char curVal;
};

ControlValue* CreateControl(char* ctrlName, char direction, char type, char highLim, char lowLim)
{
	ControlValue* newCtrl = new ControlValue();

	ClearString(newCtrl->controlName, CONTROL_NAME_MEMORY_SIZE);
	CopyStringToBuffer(newCtrl->controlName, ctrlName);
	
	newCtrl->direction = direction;
	newCtrl->type = type;
	newCtrl->highLim = highLim;
	newCtrl->lowLim = lowLim;
	newCtrl->curVal = 0;

	return newCtrl;
}