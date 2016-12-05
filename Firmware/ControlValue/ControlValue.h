#include "../Utilities/GlobalDefines.h"

#ifdef ONPC
#include <string>
#endif

class ControlValue {
public:
	enum ControlDirectionType {input = 0, output = 1};
	enum ControlType {OnOff = 0, Range = 1};

	ControlValue();
#ifdef ONPC
	ControlValue(std::string name, ControlDirectionType direction, ControlType cType);
	ControlValue(std::string controlValString);
#else
	ControlValue(char* name, ControlDirectionType direction, ControlType cType);
	ControlValue(char* controlValString);
#endif
	~ControlValue();	

	// Getters
#ifdef ONPC
	std::string 	GetControlName() 		{return controlName; };
	std::string 	GetControlString();
	void			SetControlFromString(std::string controlString);
#else
	char* 			GetControlName() 		{return controlName; };
	char* 			GetControlString();
	void			SetControlFromString(char* controlString);
#endif

	int 	GetControlDirection() 	{return controlDirection; };
	int 	GetControlType()		{return type; };



private:
	ControlDirectionType controlDirection;
	ControlType type;

	int highValue;
	int lowValue;
	int curCtrlValue;

	

#ifdef ONPC
	std::string controlName;
#else
	char controlName [CONTROL_VAL_NAME_BUFFER_LEN];
	char controlString [CONTROL_OUT_STRING_BUFFER_LEN];
#endif

};

class ControlValList{
public:
	ControlValList(int numElements);
	~ControlValList();

	void AddControlValToList(ControlValue ctrlVal);
	ControlValue GetControlAtIndex(int index) {return ctrlValArray[index];};
	int GetMaxElementIndex() {return currentMaxElement; };

private:
	ControlValue *ctrlValArray;
	int currentMaxElement;
};
