class ControlInfo:

	controlName = "Default"
	controlDirection = 0
	controlType = 0
	controlID = 0;
	highVal = 1
	lowVal = 0
	curVal = 0

	def __init__(self, newControlID):
		self.curVal = 0
		self.controlID = newControlID
		return

	def GetControlName(self) :
		return raw_input('Enter control name: ')

	def GetControlDirection(self) :
		controlDirStr = raw_input('Enter Control Direction (i = input. o = output): ')

		if controlDirStr == 'i' :
			return 0
		else :
			return 1

	def GetControlType(self) :
		print "Enter Control Type: "
		print "	0 - On/Off"
		print "	1 - Range"
		controlTypeStr = raw_input(':')

		return int(controlTypeStr)

	def  GetHighVal(self) :
		highValStr = raw_input('Enter control high value: ')
		return int(highValStr)

	def GetLowVal(self) :
		lowValStr = raw_input('Enter control low value: ')
		return int(lowValStr)

	def GetControlInfo(self) :
		self.controlName = self.GetControlName()
		self.controlDirection = self.GetControlDirection()
		self.controlType = self.GetControlType()

		if self.controlType == 0 :
			self.highVal = 0
			self.lowVal = 0
		else :
			self.highVal = self.GetHighVal()
			self.lowVal = self.GetLowVal()


