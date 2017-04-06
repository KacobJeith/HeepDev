class HeepMemoryUtilities:

	OpCodeVersion = 1
	ClientDataOpCode = chr(0x01)
	ControlDataOpCode = chr(0x02)

	def __init__(self):
		return

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

	def AppendClientIDToByteArray(self, byteArray, clientID) :
		clientIDByteArray = self.GetByteArrayFromValue(clientID)

		for x in range(len(clientIDByteArray), 4) :
			byteArray.append(chr(0x00))

		for x in range(0, len(clientIDByteArray)) :
			byteArray.append(clientIDByteArray[x])

		return byteArray

	def AppendClientDataToByteArray(self, byteArray, clientID) :

		byteArray.append(self.ClientDataOpCode)
		byteArray = self.AppendClientIDToByteArray(byteArray, clientID)
		versionByteArray = self.GetByteArrayFromValue(self.OpCodeVersion)
		byteArray.append(chr(len(versionByteArray)))

		for x in range(0, len(versionByteArray)) :
			byteArray.append(versionByteArray[x])

		return byteArray