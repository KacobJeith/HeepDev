#define TESTING

#ifdef TESTING
#include <string>
#include <iostream>
#endif

class ControlValue {
public:
	enum ControlDirectionType {input = 0, output = 1};
	enum ControlType {OnOff = 0, Range = 1};

	ControlValue();
#ifdef TESTING
	ControlValue(std::string name, ControlDirectionType direction, ControlType cType);
#else
	ControlValue(String name, ControlDirectionType direction, ControlType cType);
#endif
	~ControlValue();	

	// Getters
#ifdef TESTING
	std::string 	GetControlName() 		{return controlName; };
	std::string 	GetControlString();
#else
	String 			GetControlName() 		{return controlName; };
	String 			GetControlString();
#endif

	int 	GetControlDirection() 	{return controlDirection; };
	int 	GetControlType()		{return type; };



private:
	ControlDirectionType controlDirection;
	ControlType type;

	int highValue;
	int lowValue;
	int curCtrlValue;

#ifdef TESTING
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
