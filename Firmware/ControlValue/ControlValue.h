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
	ControlValue(String name, ControlDirectionType direction, ControlType cType);
	ControlValue(String controlValString);
#endif
	~ControlValue();	

	// Getters
#ifdef ONPC
	std::string 	GetControlName() 		{return controlName; };
	std::string 	GetControlString();
	void			SetControlFromString(std::string controlString);
#else
	String 			GetControlName() 		{return controlName; };
	String 			GetControlString();
	void			SetControlFromString(String controlString);
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
	String controlName
#endif

};

class ControlValList{
public:
	ControlValList(int numElements);
	~ControlValList();

	void AddControlValToList(ControlValue ctrlVal);
	ControlValue GetControlAtIndex(int index) {return ctrlValArray[index];};

private:
	ControlValue *ctrlValArray;
	int currentMaxElement;
};
