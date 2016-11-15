#define TESTING

#ifdef TESTING
#include <string>
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
#else
	String 			GetControlName() 		{return controlName; };
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

struct ControlValNode{
	ControlValNode* next;
	ControlValue controlData;
};

void AddControlToList(ControlValNode* head, ControlValue ctrl);
ControlValNode* InitializeControlList(ControlValue ctrl);

#ifdef TESTING
	void GetControlByName(ControlValNode* head, std::string name, ControlValue &ctrlVal);
#else
	void GetControlByName(ControlValNode* head, String name, ControlValue &ctrlVal);
#endif
