from HeepOpCodeUtilities import HeepOpCodeUtilities

class ResponseOpCodeParser:

	MemoryDumpOpCode = chr(0x0F)
	SuccessOpCode = chr(0x10)
	ErrorOpCode = chr(0x11)

	def __init__(self) :
		return

	def GetMemDumpROPBuffer(self, HeepClient, byteLength) :
		byteArray = []
		byteArray.append(self.MemoryDumpOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, HeepClient.ClientID)
		byteArray.append(chr(byteLength))

		return HeepOpCodeUtilities().GetStringFromByteArray(byteArray)

	def GetSuccessROPBuffer(self, HeepClient, Message) :
		byteArray = []
		byteArray.append(self.SuccessOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, HeepClient.ClientID)
		byteArray.append(chr(len(Message)))
		byteArray = HeepOpCodeUtilities().AppendStringToByteArray(byteArray, Message)

		return HeepOpCodeUtilities().GetStringFromByteArray(byteArray)

	def GetErrorROPBuffer(self, HeepClient, Message) :
		byteArray = []
		byteArray.append(self.ErrorOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, HeepClient.ClientID)
		byteArray.append(chr(len(Message)))
		byteArray = HeepOpCodeUtilities().AppendStringToByteArray(byteArray, Message)

		return HeepOpCodeUtilities().GetStringFromByteArray(byteArray)


class ActionOpCodeParser:

	IsHeepDeviceOpCode = chr(0x09)
	SetValueOpCode = chr(0x0A)
	SetPositionOpCode = chr(0x0B)

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

		successCode = HeepClient.UpdateControlsByID(controlID, data) 

		if successCode == 0 : 
			return ResponseOpCodeParser().GetSuccessROPBuffer(HeepClient, "Value Set")
		else :
			return ResponseOpCodeParser().GetErrorROPBuffer(HeepClient, "Control Not Found")

	def ExecuteSetPosition(self, byteArray, HeepClient) :
		counter = 1
		(numBytes,counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(xValue, counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 2)
		(yValue, counter) = HeepOpCodeUtilities().GetNumberFromMemory(byteArray, counter, 2)
		HeepClient.SetClientFrontEndXY(xValue, yValue)

		return ResponseOpCodeParser().GetSuccessROPBuffer(HeepClient, "XY Position Set")


	def GetActionOpCodeFromByteArray(self, byteArray, HeepClient) :

		#self.PrintDataAsByteArray(byteArray)

		AOpCode = byteArray[0]

		if AOpCode == self.IsHeepDeviceOpCode :
			return self.ExecuteIsHeepDevice(byteArray, HeepClient)
		elif AOpCode == self.SetValueOpCode :
			return self.ExecuteSetValue(byteArray, HeepClient)
		elif AOpCode == self.SetPositionOpCode :
			return self.ExecuteSetPosition(byteArray, HeepClient)

		return ResponseOpCodeParser().GetErrorROPBuffer(HeepClient, "HAPI COP Not Found") # No Opcode found

	def PrintDataAsByteArray(self, byteArray) :
		myArr = []
		for x in range(0, len(byteArray)) :
			myArr.append(byteArray[x])

		print myArr