#include "GlobalPreprocessor.h"

struct ControlValue
{
	char controlName[CONTROL_NAME_MEMORY_SIZE];
	char direction;
	char type;
	char highLim;
	char lowLim;
	char curVal;
};
