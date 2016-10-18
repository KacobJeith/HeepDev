class ControlValue: 

	HighValue = 10
	LowValue = 0
	CurCtrlValue = 0
	ControlName = 'None'

	def __init__(self, HighValue, LowValue, Name):
		self.HighValue = HighValue
		self.LowValue = LowValue
		self.ControlName = Name
 
	def GetControlValueString(self):
		myString = self.ControlName + ',' + str(self.LowValue) + ',' + str(self.HighValue)
		return myString

