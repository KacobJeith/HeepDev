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

ControlValNode* InitalizeLinkedList(ControlValue ctrl)
{
    ControlValNode* head = new ControlValNode();
    //head->next = NULL;
    head->controlData = ctrl;
    
    return head;
}

ControlValue::ControlValue()
{

}

ControlValue::ControlValue(char* name, ControlDirectionType direction, ControlType cType)
	: controlName(name)
	, controlDirection(direction)
	, type(cType)
{
}

ControlValue::~ControlValue()
{

}