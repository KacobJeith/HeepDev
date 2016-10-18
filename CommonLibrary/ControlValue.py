class ControlValue:

	#Enums
	OnOff = 0
	Range = 1

	#Controls
	ControlValueType = Range
	HighValue = 10
	LowValue = 0
	CurCtrlValue = 0
	ControlName = 'None'

	def __init__(self):
		return
 
	def GetControlValueString(self):
		if self.ControlValueType == self.OnOff :
			return self.GetOnOffString()
		elif self.ControlValueType == self.Range :
			return self.GetRangeString()

	def GetOnOffString(self) :
		myString = str(self.ControlValueType) + ',' + self.ControlName
		return myString

	def GetRangeString(self) :
		myString = str(self.ControlValueType) + ',' + self.ControlName + ',' + str(self.LowValue) + ',' + str(self.HighValue)
		return myString

	def SetOnOffFromSplitString(self, splitString, startIndex) :
		self.ControlName = splitString[startIndex + 1]
		return startIndex + 2

	def SetRangeFromSplitString(self, splitString, startIndex) :
		self.ControlName = splitString[startIndex + 1]
		self.LowValue = splitString[startIndex + 2]
		self.HighValue = splitString[startIndex + 3]
		return startIndex + 4

	def SetControlFromSplitString(self, splitString, startIndex) :
		self.ControlValueType = int(splitString[startIndex])
		newIndex = startIndex + 1

		if self.ControlValueType == self.OnOff :
			newIndex = self.SetOnOffFromSplitString(splitString, startIndex)
		elif self.ControlValueType == self.Range :
			newIndex = self.SetRangeFromSplitString(splitString, startIndex)

		return newIndex