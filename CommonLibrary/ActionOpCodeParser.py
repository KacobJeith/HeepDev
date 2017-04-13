from HeepOpCodeUtilities import HeepOpCodeUtilities

class ResponseOpCodeParser:

	MemoryDumpOpCode = chr(0x0F)

	def __init__(self) :
		return

	def GetMemDumpROPBuffer(self, HeepClient, byteLength) :
		byteArray = []
		byteArray.append(self.MemoryDumpOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, HeepClient.ClientID)
		byteArray.append(chr(byteLength))

		return HeepOpCodeUtilities().GetStringFromByteArray(byteArray)

class ActionOpCodeParser:

	IsHeepDeviceOpCode = chr(0x09)
	SetValueOpCode = chr(0x0A)

	def __init__(self) :
		return

	def ExecuteIsHeepDevice(self, byteArray, HeepClient) :
		counter = 1
		(numBytes,counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1) # Always 0 with IsHeepDevice COP

		clientMemoryDump = HeepClient.GetClientString()

		MemDumpROP = ResponseOpCodeParser().GetMemDumpROPBuffer(HeepClient, len(clientMemoryDump))

		return  MemDumpROP + clientMemoryDump

	def ExecuteSetValue(self, byteArray, HeepClient) :
		counter = 1
		(numBytes,counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(controlID, counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(data, counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, numBytes-1)

		return HeepClient.UpdateControlsByID(controlID, data) 

	def GetActionOpCodeFromByteArray(self, byteArray, HeepClient) :

		self.PrintDataAsByteArray(byteArray)

		AOpCode = byteArray[0]

		if AOpCode == self.IsHeepDeviceOpCode :
			return self.ExecuteIsHeepDevice(byteArray, HeepClient)
		elif AOpCode == self.SetValueOpCode :
			return str(self.ExecuteSetValue(byteArray, HeepClient))

		return str(2) # No Opcode found

	def PrintDataAsByteArray(self, byteArray) :
		myArr = []
		for x in range(0, len(byteArray)) :
			myArr.append(byteArray[x])

		print myArr