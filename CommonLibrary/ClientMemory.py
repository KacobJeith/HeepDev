from HeepMemoryUtilities import HeepMemoryUtilities

# This is simulated client memory

class ClientMemory:

	MemoryUtilities = HeepMemoryUtilities()
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
		self.miscMemory = self.MemoryUtilities.SetClientXY(self.miscMemory, xValue, yValue, clientID)

	def SetClientName(self, clientName, clientID) :
		self.miscMemory = self.MemoryUtilities.SetClientName(self.miscMemory, clientName, clientID)

	def SetIconIDAndData(self, iconID, iconData, clientID) :
		self.miscMemory = self.MemoryUtilities.AppendIconIDToByteArray(self.miscMemory, clientID, iconID)
		self.miscMemory = self.MemoryUtilities.AppendIconDataToByteArray(self.miscMemory, clientID, iconData)

	def GetIconIDAndData(self, clientID) :
		iconID = self.MemoryUtilities.GetIconIDFromByteArray(self.miscMemory, clientID)
		iconData = self.MemoryUtilities.GetIconDataFromByteArray(self.miscMemory, clientID)

		return (iconID, iconData)

	def GetClientXY(self, clientID) :
		clientInfo = self.MemoryUtilities.GetClientXYInfo(self.miscMemory, clientID)
		return (clientInfo[2], clientInfo[3])

	def GetClientName(self, clientID) :
		clientNameInfo = self.MemoryUtilities.GetClientNameInfo(self.miscMemory, clientID)
		return clientNameInfo[2]

	def SetVertex(self, vertex) :
		self.miscMemory = self.MemoryUtilities.AppendVertexDataToByteArray(self.miscMemory, vertex)

	def GetMemoryString(self) :
		return self.MemoryUtilities.GetStringFromByteArray(self.miscMemory)