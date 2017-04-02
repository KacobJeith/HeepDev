# This is simulated client memory

class ClientMemory:

	XPositionOpCode = chr(0x01)
	YPositionOpcode = chr(0x02)

	def __init__(self):
		self.totalMemory = 1024 #In Bytes
		self.miscMemory = []
		return


	def SetClientX(self, xValue) :
		self.miscMemory.append(self.XPositionOpCode)
		self.miscMemory.append(chr(0x02))
		xValHigh = xValue >> 8
		xValLow = xValue%255
		self.miscMemory.append(chr(xValHigh))
		self.miscMemory.append(chr(xValLow))

	def SetClientY(self, yValue) :
		self.miscMemory.append(self.YPositionOpcode)
		self.miscMemory.append(chr(0x02))
		yValHigh = yValue >> 8
		yValLow = yValue%255
		self.miscMemory.append(chr(yValHigh))
		self.miscMemory.append(chr(yValLow))

	def GetNecessaryBytes(self, value) :
		numBytes = 1

		value = value / 256

		while value > 0 :
			numBytes += 1
			value = value / 256

		return numBytes

	def GetMemoryString(self) :
		myString = 'M'

		for x in range(0, len(self.miscMemory)) :
			myString = myString + str(self.miscMemory[x])

		print self.miscMemory
		print myString

		return myString
