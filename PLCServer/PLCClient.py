class PLCClient:

	#Client Enums
	OnOff = 0
	Analog = 1
	Light = 2
	Other = 3

	ClientType = 1
	IPAddress = 'none'
	ClientName = 'none'

	def __init__(self, ClientType, IPAddress, ClientName):
		self.ClientType = ClientType
		self.IPAddress = IPAddress
		self.ClientName = ClientName
 
	def GetClientString(self):
		myString = self.IPAddress + ',' + str(self.ClientType) + ',' + self.ClientName + '\n'
		return myString

