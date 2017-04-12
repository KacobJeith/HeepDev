from HeepOpCodeUtilities import HeepOpCodeUtilities

class ActionOpCodeParser:

	SetValueOpCode = chr(0x0A)

	def __init__(self) :
		return

	def ExecuteSetValue(self, byteArray, HeepClient) :
		counter = 1
		(numBytes,counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(controlID, counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(data, counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, numBytes-1)

		return HeepClient.UpdateControlsByID(controlID, data) 

	def GetActionOpCodeFromByteArray(self, byteArray, HeepClient) :

		self.PrintDataAsByteArray(byteArray)

		AOpCode = byteArray[0]

		if AOpCode == self.SetValueOpCode :
			return self.ExecuteSetValue(byteArray, HeepClient)

		return 2 # No Opcode found

	def PrintDataAsByteArray(self, byteArray) :
		myArr = []
		for x in range(0, len(byteArray)) :
			myArr.append(byteArray[x])

		print myArr