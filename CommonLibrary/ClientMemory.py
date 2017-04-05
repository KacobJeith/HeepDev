# This is simulated client memory

class ClientMemory:

	ClientMemoryFileName = 'ClientMemory.dat'

	# Currently this version must be updated manually
	Version = 1

	XPositionOpCode = chr(0x01)
	YPositionOpcode = chr(0x02)
	ClientNameOpCode = chr(0x06)

	def __init__(self):
		self.totalMemory = 1024 #In Bytes
		self.miscMemory = []
		return


	def WriteClientMemoryToFile(self) :
		writeFile = open(self.ClientMemoryFileName, 'w')
		writeFile.write(self.GetMemoryString())
		writeFile.close()

	def SetClientX(self, xValue, clientID) :
		self.miscMemory.append(self.XPositionOpCode)
		self.AppendClientIDToMemory(clientID)
		self.AppendByteArrayToMemory(self.GetConstantSizeByteArrayFromValue(xValue, 2))

	def SetClientY(self, yValue, clientID) :
		self.miscMemory.append(self.YPositionOpcode)
		self.AppendClientIDToMemory(clientID)
		self.AppendByteArrayToMemory(self.GetConstantSizeByteArrayFromValue(yValue, 2))

	def SetClientName(self, clientName, clientID) :
		self.miscMemory.append(self.ClientNameOpCode)
		self.AppendClientIDToMemory(clientID)
		self.miscMemory.append(chr(len(clientName)))
		self.AppendStringToMemory(clientName)

	def GetClientIDFromMemory(self, counter) :

		clientIDAndCounter = self.GetNumberFromMemory(counter, 4)

		return clientIDAndCounter

	def GetNumberFromMemory(self, counter, numBytes) :

		retVal = 0

		byteCounter = numBytes - 1
		for x in range(0, numBytes) :
			curVal = ord(self.miscMemory[counter]) << (8*byteCounter)
			byteCounter -= 1
			retVal += curVal
			counter += 1

		return (retVal, counter)

	def ReadXOpcode(self, counter) :
		counter = counter+1

		clientIDAndCounter = self.GetClientIDFromMemory(counter)
		counter = clientIDAndCounter[1]
		clientID = clientIDAndCounter[0]
		print clientID

		valueAndCounter = self.GetNumberFromMemory(counter, 2)
		xValue = valueAndCounter[0]
		counter = valueAndCounter[1]

		print xValue

		return counter

	def ReadYOpcode(self, counter) :
		counter = counter+1

		clientIDAndCounter = self.GetClientIDFromMemory(counter)
		counter = clientIDAndCounter[1]
		clientID = clientIDAndCounter[0]
		print clientID

		valueAndCounter = self.GetNumberFromMemory(counter, 2)
		yValue = valueAndCounter[0]
		counter = valueAndCounter[1]
		print yValue

		return counter

	def ReadClientNameOpCode(self, counter) :

		counter = counter+1

		clientIDAndCounter = self.GetClientIDFromMemory(counter)
		counter = clientIDAndCounter[1]
		clientID = clientIDAndCounter[0]
		print clientID

		byteLength = ord(self.miscMemory[counter])
		print byteLength

		counter = counter + 1
		clientName = ""
		for x in range(0, byteLength) :
			clientName += self.miscMemory[counter]
			counter = counter + 1

		print clientName

		counter = counter + 1

		return counter 

	def ReadOpCode(self, counter) :
		if self.miscMemory[counter] == self.XPositionOpCode :
			counter = self.ReadXOpcode(counter)
		elif self.miscMemory[counter] == self.YPositionOpcode :
			counter = self.ReadYOpcode(counter)
		elif self.miscMemory[counter] == self.ClientNameOpCode :
			counter = self.ReadClientNameOpCode(counter)

		return counter

	def GetClientX(self, clientID) :
		counter = 0
		while counter < len(self.miscMemory) :
			counter = self.ReadOpCode(counter)


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
		myString = 'V' + str(self.Version) + ',M'

		for x in range(0, len(self.miscMemory)) :
			myString = myString + str(self.miscMemory[x])

		print self.miscMemory
		print myString

		return myString
