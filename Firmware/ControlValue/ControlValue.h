class ControlValue {
public:
	enum ControlDirectionType {input = 0, output = 1};
	enum ControlType {OnOff = 0, Range = 1};

	ControlValue();
	ControlValue(char* name, ControlDirectionType direction, ControlType cType);
	~ControlValue();	

	// Getters
	char* 	GetControlName() 		{return controlName; };
	int 	GetControlDirection() 	{return controlDirection; };
	int 	GetControlType()		{return type; };

private:
	ControlDirectionType controlDirection;
	ControlType type;

	int highValue;
	int lowValue;
	int curCtrlValue;

	char* controlName;

};

struct ControlValNode{
	ControlValNode* next;
	ControlValue controlData;
};

void AddControlToList(ControlValNode* head);
ControlValNode* InitalizeLinkedList(ControlValue ctrl);