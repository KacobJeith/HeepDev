from MemoryUtilities import MemoryUtilities

# This is simulated client memory

class DeviceMemory:

	ClientMemoryFileName = 'ClientMemory.dat'

	def __init__(self):
		self.totalMemory = 1024 #In Bytes
		self.miscMemory = []
		return

	def WriteClientMemoryToFile(self) :
		writeFile = open(self.ClientMemoryFileName, 'w')
		writeFile.write(self.GetMemoryString())
		writeFile.close()

	def SetClientXY(self, xValue, yValue, clientID) :
		self.miscMemory = MemoryUtilities().SetClientXY(self.miscMemory, xValue, yValue, clientID)

	def SetClientName(self, clientName, clientID) :
		self.miscMemory = MemoryUtilities().SetClientName(self.miscMemory, clientName, clientID)

	def SetIconIDAndData(self, iconID, iconData, clientID) :
		self.miscMemory = MemoryUtilities().AppendIconIDToByteArray(self.miscMemory, clientID, iconID)
		self.miscMemory = MemoryUtilities().AppendIconDataToByteArray(self.miscMemory, clientID, iconData)

	def GetIconIDAndData(self, clientID) :
		iconID = MemoryUtilities().GetIconIDFromByteArray(self.miscMemory, clientID)
		iconData = sMemoryUtilities().GetIconDataFromByteArray(self.miscMemory, clientID)

		return (iconID, iconData)

	def GetClientXY(self, clientID) :
		clientInfo = MemoryUtilities().GetClientXYInfo(self.miscMemory, clientID)
		return (clientInfo[2], clientInfo[3])

	def GetClientName(self, clientID) :
		clientNameInfo = MemoryUtilities().GetClientNameInfo(self.miscMemory, clientID)
		return clientNameInfo[2]

	def SetVertex(self, vertex) :
		self.miscMemory = MemoryUtilities().AppendVertexDataToByteArray(self.miscMemory, vertex)

	def DeleteVertex(self, vertex) :
		
		self.miscMemory = MemoryUtilities().DeleteVertexFromByteArray(self.miscMemory, vertex)

	def SetIPAddress(self, clientID, IPAddress) :
		self.miscMemory = MemoryUtilities().AppendIPAddressToByteArray(self.miscMemory, clientID, IPAddress)

	def GetIPAddress(self, clientID) :
		return MemoryUtilities().GetIPAddressFromByteArray(self.miscMemory, clientID)

	def GetMemoryString(self) :
		return MemoryUtilities().GetStringFromByteArray(self.miscMemory)