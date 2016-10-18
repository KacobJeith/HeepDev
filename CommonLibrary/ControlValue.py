class ControlValue:

	#Enums
	OnOff = 0
	Range = 1
	String = 2

	#Controls
	ControlValueType = Range
	HighValue = 10
	LowValue = 0
	CurCtrlValue = 0
	ControlName = 'None'

	def __init__(self, HighValue, LowValue, Name):
		self.HighValue = HighValue
		self.LowValue = LowValue
		self.ControlName = Name
 
	def GetControlValueString(self):
		myString = str(self.ControlValueType) + ',' + self.ControlName + ',' + str(self.LowValue) + ',' + str(self.HighValue)
		return myString