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

	def GetClientXY(self, clientID) :
		clientInfo = self.MemoryUtilities.GetClientXYInfo(self.miscMemory, clientID)
		return (clientInfo[2], clientInfo[3])

	def GetClientName(self, clientID) :
		clientNameInfo = self.MemoryUtilities.GetClientNameInfo(self.miscMemory, clientID)
		return clientNameInfo[2]

	def SetVertex(self, vertex) :
		self.miscMemory = self.MemoryUtilities.AppendVertexDataToByteArray(self.miscMemory, vertex)

	def GetMemoryString(self) :
		print self.miscMemory
		return self.MemoryUtilities.GetStringFromByteArray(self.miscMemory)
