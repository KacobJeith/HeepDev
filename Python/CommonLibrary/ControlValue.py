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
	ControlID = 0

	def __init__(self):
		return
 
	def GetControlValueString(self):
		if self.ControlValueType == self.OnOff :
			self.HighValue = 1
			self.LowValue = 0;

		myString = str(self.ControlDirection) + ',' + str(self.ControlValueType) + ',' + self.ControlName + ',' + str(self.LowValue) + ',' + str(self.HighValue)
		return myString

	def SetControlFromSplitString(self, splitString, startIndex) :
		self.ControlDirection = int(splitString[startIndex])
		self.ControlValueType = int(splitString[startIndex+1])
		startIndex = startIndex+1

		# May need to be modified in the future for string inputs
		self.ControlName = splitString[startIndex + 1]
		self.LowValue = int(splitString[startIndex + 2])
		self.HighValue = int(splitString[startIndex + 3])
		return startIndex + 4

	def PrepareForJSONWrite(self) :
		self.ControlValueType = self.ControlValueType
		self.HighValue = self.HighValue
		self.LowValue = self.LowValue
		self.CurCtrlValue = self.CurCtrlValue
		self.ControlName = self.ControlName
		self.ControlDirection = self.ControlDirection

	def FromDict(self, Dict) :
		self.__dict__ = Dict


