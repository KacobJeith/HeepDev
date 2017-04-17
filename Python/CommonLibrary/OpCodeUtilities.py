class OpCodeUtilities:

	OpCodeVersion = 1

	def __init__(self):
		return

	def GetNumberFromMemory(self, byteArray, counter, numBytes) :

		retVal = 0

		byteCounter = numBytes - 1
		for x in range(0, numBytes) :
			curVal = ord(byteArray[counter]) << (8*byteCounter)
			byteCounter -= 1
			retVal += curVal
			counter += 1

		return (retVal, counter)

	def AppendDeviceIDToByteArray(self, byteArray, deviceID) :
		deviceIDByteArray = self.GetByteArrayFromValue(deviceID)

		for x in range(len(deviceIDByteArray), 4) :
			byteArray.append(chr(0x00))

		for x in range(0, len(deviceIDByteArray)) :
			byteArray.append(deviceIDByteArray[x])

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

	def GetStringFromByteArray(self, byteArray) :
		myString = ""

		for x in range(0, len(byteArray)) :
			myString = myString + str(byteArray[x])

		return myString

	def ConvertStringToByteArray(self, string) :
		byteArray = []
		for x in range(0, len(string)) :
			byteArray.append(string[x])

		return byteArray

	def AppendStringToByteArray(self, byteArray, theString) :
		for x in range(0, len(theString)) :
			byteArray.append(theString[x])

		return byteArray

	def GetDeviceIDFromMemory(self, byteArray, counter) :

		deviceIDAndCounter = self.GetNumberFromMemory(byteArray, counter, 4)

		return deviceIDAndCounter

