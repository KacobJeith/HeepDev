#include "ControlValue.h"

void AddControlToList(ControlValNode* head, ControlValue ctrl)
{
	ControlValNode* newNode;
    
    newNode = new ControlValNode();
   
    newNode->controlData = ctrl;
    
    ControlValNode* tracker = head;
    while(tracker->next){tracker = tracker->next;}
    
    tracker->next = newNode;
}

ControlValNode* InitializeControlList(ControlValue ctrl)
{
    ControlValNode* head = new ControlValNode();
    //head->next = NULL;
    head->controlData = ctrl;
    
    return head;
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