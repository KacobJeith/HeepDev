# This is simulated client memory

class ClientMemory:

	# Currently this version must be updated manually
	Version = 1

	XPositionOpCode = chr(0x01)
	YPositionOpcode = chr(0x02)

	def __init__(self):
		self.totalMemory = 1024 #In Bytes
		self.miscMemory = []
		return


	def SetClientX(self, xValue, clientID) :
		self.miscMemory.append(self.XPositionOpCode)
		self.AppendClientIDToMemory(clientID)
		self.miscMemory.append(chr(self.GetNecessaryBytes(xValue)))
		self.AppendByteArrayToMemory(self.GetByteArrayFromValue(xValue))

	def SetClientY(self, yValue, clientID) :
		self.miscMemory.append(self.YPositionOpcode)
		self.AppendClientIDToMemory(clientID)
		self.miscMemory.append(chr(self.GetNecessaryBytes(yValue)))
		self.AppendByteArrayToMemory(self.GetByteArrayFromValue(yValue))

	# Always add 4 bytes for client ID to memory
	def AppendClientIDToMemory(self, clientID) :
		clientIDByteArray = self.GetByteArrayFromValue(clientID)

		for x in range(len(clientIDByteArray), 4) :
			self.miscMemory.append(chr(0x00))

		self.AppendByteArrayToMemory(clientIDByteArray)

	def AppendByteArrayToMemory(self, byteArray) :
		for x in range(0, len(byteArray)) :
			self.miscMemory.append(byteArray[x])

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
