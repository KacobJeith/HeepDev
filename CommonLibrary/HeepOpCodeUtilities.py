class HeepOpCodeUtilities:

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
