import json
from ControlValue import ControlValue

class PLCClient:

	ClientType = 1
	IPAddress = 'none'
	ClientName = 'none'
	ControlList = []

	def __init__(self):
		ClientType = 1
		IPAddress = 'none'
		ClientName = 'none'
		ControlList = []
		return
 
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

	def toJSON(self):
		return json.dumps(self, default=lambda o: o.__dict__, sort_keys=True, indent=4, separators=(',', ': '))

	def fromJSON(self, Data) :
		self.__dict__ = json.loads(Data)

	def fromDict(self, Dict) :
		self.__dict__ = Dict
		tempControlList = self.ControlList
		self.ControlList = []
		for x in range(0, len(tempControlList)) :
			newControl = ControlValue()
			newControl.FromDict(tempControlList[x])
			self.ControlList.append(newControl)