from HeepOpCodeUtilities import HeepOpCodeUtilities

class ActionOpCodeParser:

	SetValueOpCode = chr(0x0A)

	def __init__(self) :
		return

	def ExecuteSetValue(self, byteArray, HeepClient) :
		counter = 1
		(numBytes,counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(controlID, counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(data, counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, numBytes)

		print numBytes
		print controlID
		print data

	def GetActionOpCodeFromByteArray(self, byteArray, HeepClient) :

		AOpCode = byteArray[0]

		if AOpCode == self.SetValueOpCode :
			self.ExecuteSetValue(byteArray, HeepClient)

		return
