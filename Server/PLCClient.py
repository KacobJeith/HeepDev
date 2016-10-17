from ControlValue import ControlValue
import json

class PLCClient:

	#Client Enums
	OnOff = 0
	Analog = 1
	Light = 2
	Other = 3

	ClientType = 1
	IPAddress = 'none'
	ClientName = 'none'
	ControlList = []

	def __init__(self, ClientType, IPAddress, ClientName, ControlList):
		self.ClientType = ClientType
		self.IPAddress = IPAddress
		self.ClientName = ClientName
		self.ControlList = ControlList

	def toJSON(self):
		return json.dumps(self, default=lambda o: o.__dict__, sort_keys=True, indent=4, separators=(',', ': '))
 
	def GetClientString(self):
		myString = self.IPAddress + ',' + str(self.ClientType) + ',' + self.ClientName
		for x in range(0, len(self.ControlList)) :
			myString = myString + ',' + self.ControlList[x].GetControlValueString()
		myString = myString + '\n'
		return myString

