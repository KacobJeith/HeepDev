class ControlValue:

	#Enums for Types
	OnOff = 0
	Range = 1

	# Enums for Inputs / Outputs
	Input = 0
	Output = 1

	#Controls
	ControlValueType = Range
	ControlDirection = Input
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
		myString = str(self.ControlDirection) + ',' + str(self.ControlValueType) + ',' + self.ControlName + ',' + str(self.LowValue) + ',' + str(self.HighValue)
		return myString

	def SetOnOffFromSplitString(self, splitString, startIndex) :
		self.ControlName = splitString[startIndex + 1]
		return startIndex + 2

	def SetRangeFromSplitString(self, splitString, startIndex) :
		self.ControlName = splitString[startIndex + 1]
		self.LowValue = int(splitString[startIndex + 2])
		self.HighValue = int(splitString[startIndex + 3])
		return startIndex + 4

	def SetControlFromSplitString(self, splitString, startIndex) :
		self.ControlDirection = int(splitString[startIndex])
		self.ControlValueType = int(splitString[startIndex+1])
		startIndex = startIndex+1
		newIndex = startIndex + 1

		if self.ControlValueType == self.OnOff :
			newIndex = self.SetOnOffFromSplitString(splitString, startIndex)
		elif self.ControlValueType == self.Range :
			newIndex = self.SetRangeFromSplitString(splitString, startIndex)

		return newIndex

	def PrepareForJSONWrite(self) :
		self.ControlValueType = self.ControlValueType
		self.HighValue = self.HighValue
		self.LowValue = self.LowValue
		self.CurCtrlValue = self.CurCtrlValue
		self.ControlName = self.ControlName
		self.ControlDirection = self.ControlDirection

	def FromDict(self, Dict) :
		self.__dict__ = Dict


