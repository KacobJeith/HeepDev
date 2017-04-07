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

	def GetClientIDFromMemory(self, counter) :

		clientIDAndCounter = self.GetNumberFromMemory(counter, 4)

		return clientIDAndCounter

	def SkipOpCode(self, counter) :
		counter += 5 # This skips the Client ID and lands on the bytes to skip

		bytesToSkip = ord(self.miscMemory[counter])
		counter += bytesToSkip + 1

		return counter

	def GetNumberFromMemory(self, counter, numBytes) :

		retVal = 0

		byteCounter = numBytes - 1
		for x in range(0, numBytes) :
			curVal = ord(self.miscMemory[counter]) << (8*byteCounter)
			byteCounter -= 1
			retVal += curVal
			counter += 1

		return (retVal, counter)

	def ReadClientNameOpCode(self, counter) :
		return self.MemoryUtilities.ReadClientNameOpCode(self.miscMemory, counter)

	def GetClientXY(self, clientID) :
		clientInfo = self.MemoryUtilities.GetClientXYInfo(self.miscMemory, clientID)

		return (clientInfo[2], clientInfo[3])

	def GetClientName(self, clientID) :
		clientNameInfo = self.MemoryUtilities.GetClientNameInfo(self.miscMemory, clientID)
		return clientNameInfo[2]


	# Always add 4 bytes for client ID to memory
	def AppendClientIDToMemory(self, clientID) :
		clientIDByteArray = self.GetByteArrayFromValue(clientID)

		for x in range(len(clientIDByteArray), 4) :
			self.miscMemory.append(chr(0x00))

		self.AppendByteArrayToMemory(clientIDByteArray)

	def AppendStringToMemory(self, theString) :
		for x in range(0, len(theString)) :
			self.miscMemory.append(theString[x])

	def AppendByteArrayToMemory(self, byteArray) :
		for x in range(0, len(byteArray)) :
			self.miscMemory.append(byteArray[x])

	def GetConstantSizeByteArrayFromValue(self, value, size) :
		byteArray = []

		numBytes = self.GetNecessaryBytes(value)

		byteArray = self.GetByteArrayFromValue(value)

		for x in range(0, size-numBytes) :
			byteArray.insert(0, chr(0x00))

		return byteArray



	def GetByteArrayFromValue(self, value) :
		byteArray = []
		numBytes = self.GetNecessaryBytes(value)
		for x in range(0, numBytes) :
			byteArray.insert(0, chr(value%256))
			value = value/256

		return byteArray

	def GetNecessaryBytes(self, value) :
		numBytes = 1

		value = value / 256

		while value > 0 :
			numBytes += 1
			value = value / 256

		return numBytes

	def GetMemoryString(self) :
		myString = ""

		for x in range(0, len(self.miscMemory)) :
			myString = myString + str(self.miscMemory[x])

		print self.miscMemory
		print myString

		return myString
