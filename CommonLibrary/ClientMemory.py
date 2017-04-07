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

	def AppendClientXYToMemory(self, xValue, yValue, clientID) :
		self.miscMemory = self.MemoryUtilities.AppendClientXYToByteArray(self.miscMemory, xValue, yValue, clientID)

	def OverwriteClientXYInMemory(self, xValue, yValue, counter) :
		xByteArray = self.GetConstantSizeByteArrayFromValue(xValue, 2)
		yByteArray = self.GetConstantSizeByteArrayFromValue(yValue, 2)
		
		self.miscMemory[counter - 1] = yByteArray[1]
		self.miscMemory[counter - 2] = yByteArray[0]
		self.miscMemory[counter - 3] = xByteArray[1]
		self.miscMemory[counter - 4] = xByteArray[0]

	def SetClientXY(self, xValue, yValue, clientID) :

		clientXYInfo = self.GetClientXYInfo(clientID)

		if clientXYInfo[2] == -1 and clientXYInfo[3] == -1 :
			self.AppendClientXYToMemory(xValue, yValue, clientID)
		else :
			counter = clientXYInfo[0]
			self.OverwriteClientXYInMemory(xValue, yValue, counter)

	def SetClientName(self, clientName, clientID) :
		self.miscMemory.append(self.MemoryUtilities.ClientNameOpCode)
		self.AppendClientIDToMemory(clientID)
		self.miscMemory.append(chr(len(clientName)))
		self.AppendStringToMemory(clientName)

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

	def ReadXYOpcode(self, counter) :
		counter = counter+1

		clientIDAndCounter = self.GetClientIDFromMemory(counter)
		counter = clientIDAndCounter[1]
		clientID = clientIDAndCounter[0]

		counter +=1
		valueAndCounter = self.GetNumberFromMemory(counter, 2)
		xValue = valueAndCounter[0]
		counter = valueAndCounter[1]

		valueAndCounter = self.GetNumberFromMemory(counter, 2)
		yValue = valueAndCounter[0]
		counter = valueAndCounter[1]

		return (counter, clientID, xValue, yValue)

	def ReadClientNameOpCode(self, counter) :

		counter = counter+1

		clientIDAndCounter = self.GetClientIDFromMemory(counter)
		counter = clientIDAndCounter[1]
		clientID = clientIDAndCounter[0]

		byteLength = ord(self.miscMemory[counter])

		counter = counter + 1
		clientName = ""
		for x in range(0, byteLength) :
			clientName += self.miscMemory[counter]
			counter = counter + 1

		return (counter, clientID, clientName) 

	def GetClientXY(self, clientID) :
		clientInfo = self.GetClientXYInfo(clientID)

		return (clientInfo[2], clientInfo[3])

	def GetClientXYInfo(self, clientID) :
		counter = 0
		while counter < len(self.miscMemory) :
			if self.miscMemory[counter] == self.MemoryUtilities.XYPositionOpCode :
				capturedXY = self.ReadXYOpcode(counter)
				counter = capturedXY[0]
				capturedClient = capturedXY[1]
				
				if capturedClient == clientID :
					return capturedXY

			else :
				counter = self.SkipOpCode(counter)

		return (0, 0, -1, -1)

	def GetClientName(self, clientID) :
		clientNameInfo = self.GetClientNameInfo(clientID)
		return clientNameInfo[2]

	def GetClientNameInfo(self, clientID) :
		counter = 0
		while counter < len(self.miscMemory) :
			if self.miscMemory[counter] == self.MemoryUtilities.ClientNameOpCode :
				capturedName = self.ReadClientNameOpCode(counter)
				counter = capturedName[0]

				if capturedName[1] == clientID :
					return capturedName

			else :
				counter = self.SkipOpCode(counter)

		return (0, 0, 'None')


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
