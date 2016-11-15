class ControlValue {
public:
	ControlValue();
	ControlValue(char* name);
	~ControlValue();	

	// Getters
	char* 	GetControlName() {return controlName; };

private:
	char* controlName;
};