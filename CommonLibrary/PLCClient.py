import json
from ControlValue import ControlValue

class PLCClient:

	def __init__(self):
		self.ClientType = 1
		self.IPAddress = 'none'
		self.ClientName = 'none'
		self.ControlList = []
		self.ControlQueue = []
		return
 
 	def QueueControlByName(self, name, ControlValue) :
 		for x in range(0, len(self.ControlList)) :
 			if self.ControlList[x].ControlName == name :
 				self.ControlList[x].CurCtrlValue = ControlValue
 				self.QueueControl(self.ControlList[x])
 				return

 		return

	def QueueControl(self, ControlVal) :
		for x in range(0, len(self.ControlQueue) ) :
			if self.ControlQueue[x][0] == ControlVal.ControlName :
				self.ControlQueue[x] = (ControlVal.ControlName, ControlVal.CurCtrlValue)
				return

		self.ControlQueue.append( (ControlVal.ControlName, ControlVal.CurCtrlValue) )
		return

	def UpdateControlByName(self, name, value) :
		for x in range(0, len(self.ControlList)) :
			if self.ControlList[x].ControlName == name :
				self.ControlList[x].CurCtrlValue = value
				return
		return

	def UpdateControlsByString(self, controlString) :
		controlList = controlString.split(';')
		
		for x in range(0, len(controlList)) :
			if len(controlList[x]) > 0:
				curCommand = controlList[x].split(',')
				self.UpdateControlByName(curCommand[0], int(curCommand[1]))

		return

	def GetQueuedControlString(self) :
		retString = ""
		for x in range(0, len(self.ControlQueue)) :
			retString = retString + self.ControlQueue[x][0] + ',' + str(self.ControlQueue[x][1]) +';'

		self.ControlQueue = []
		return retString

	def GetClientString(self):
		myString = self.IPAddress + ',' + str(self.ClientType) + ',' + self.ClientName
		for x in range(0, len(self.ControlList)) :
			myString = myString + ',' + self.ControlList[x].GetControlValueString()
		myString = myString + '\n'
		return myString

	def SetClientFromString(self, clientString) :
		self.ControlList = []
		splitString = clientString.split(',')
		self.IPAddress = splitString[0]
		self.ClientType = int(splitString[1])
		self.ClientName = splitString[2]

		it = 3
		while it < len(splitString) :
			control = ControlValue()
			it = control.SetControlFromSplitString(splitString, it)
			self.ControlList.append(control)

	def prepareForJSON(self) :
		self.ClientType = self.ClientType
		self.IPAddress = self.IPAddress
		self.ClientName = self.ClientName
		self.ControlList = self.ControlList

		for x in range(0, len(self.ControlList)) :
			self.ControlList[x].PrepareForJSONWrite()

	def toJSON(self):
		self.prepareForJSON()
		return json.dumps(self, default=lambda o: o.__dict__, sort_keys=True, indent=4, separators=(',', ': '))

	def toJSONDict(self) :
		return json.loads(self.toJSON())

	def fromJSON(self, Data) :
		self.fromDict(json.loads(Data))

	def fromDict(self, Dict) :
		self.__dict__ = Dict
		tempControlList = self.ControlList
		self.ControlList = []
		for x in range(0, len(tempControlList)) :
			newControl = ControlValue()
			newControl.FromDict(tempControlList[x])
			self.ControlList.append(newControl)