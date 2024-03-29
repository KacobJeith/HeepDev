from OpCodeUtilities import OpCodeUtilities
from Vertex import Vertex
from CommonDataTypes import HeepIPAddress

class ResponseOpCodeParser:

	MemoryDumpOpCode = chr(0x0F)
	SuccessOpCode = chr(0x10)
	ErrorOpCode = chr(0x11)

	def __init__(self) :
		return

	def GetMemDumpROPBuffer(self, HeepDevice, byteLength) :
		byteArray = []
		byteArray.append(self.MemoryDumpOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, HeepDevice.DeviceID)
		byteArray.append(chr(byteLength))

		return OpCodeUtilities().GetStringFromByteArray(byteArray)

	def GetSuccessROPBuffer(self, HeepDevice, Message) :
		byteArray = []
		byteArray.append(self.SuccessOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, HeepDevice.DeviceID)
		byteArray.append(chr(len(Message)))
		byteArray = OpCodeUtilities().AppendStringToByteArray(byteArray, Message)

		return OpCodeUtilities().GetStringFromByteArray(byteArray)

	def GetErrorROPBuffer(self, HeepDevice, Message) :
		byteArray = []
		byteArray.append(self.ErrorOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, HeepDevice.DeviceID)
		byteArray.append(chr(len(Message)))
		byteArray = OpCodeUtilities().AppendStringToByteArray(byteArray, Message)

		return OpCodeUtilities().GetStringFromByteArray(byteArray)


class ActionOpCodeParser:

	IsHeepDeviceOpCode = chr(0x09)
	SetValueOpCode = chr(0x0A)
	SetPositionOpCode = chr(0x0B)
	SetVertexOpCode = chr(0x0C)
	DeleteVertexOpCode = chr(0x0D)

	def __init__(self) :
		return

	def ExecuteIsHeepDevice(self, byteArray, HeepDevice) :
		counter = 1
		(numBytes,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1) # Always 0 with IsHeepDevice COP

		clientMemoryDump = HeepDevice.GetDeviceString()

		MemDumpROP = ResponseOpCodeParser().GetMemDumpROPBuffer(HeepDevice, len(clientMemoryDump))

		return  MemDumpROP + clientMemoryDump

	def ExecuteSetValue(self, byteArray, HeepDevice) :
		counter = 1
		(numBytes,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(controlID, counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(data, counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, numBytes-1)

		successCode = HeepDevice.UpdateControlsByID(controlID, data) 

		if successCode == 0 : 
			return ResponseOpCodeParser().GetSuccessROPBuffer(HeepDevice, "Value Set")
		else :
			return ResponseOpCodeParser().GetErrorROPBuffer(HeepDevice, "Control Not Found")

	def ExecuteSetPosition(self, byteArray, HeepDevice) :
		counter = 1
		(numBytes,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(xValue, counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 2)
		(yValue, counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 2)
		HeepDevice.SetFrontEndXY(xValue, yValue)

		return ResponseOpCodeParser().GetSuccessROPBuffer(HeepDevice, "XY Position Set to (" + str(xValue) + ',' + str(yValue) + ')')

	def ExecuteAddVertex(self, byteArray, HeepDevice) :
		counter = 1
		(numBytes,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(TxID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
		(RxID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
		(TxControl, counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(RxControl, counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)

		(IPOct1,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(IPOct2,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(IPOct3,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(IPOct4,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		destinationIP = HeepIPAddress(IPOct1, IPOct2, IPOct3, IPOct4)

		NewVertex = Vertex()
		NewVertex.sourceID = TxID
		NewVertex.outputID = TxControl
		NewVertex.destinationID = RxID
		NewVertex.inputID = RxControl
		NewVertex.destinationIP = destinationIP

		HeepDevice.AddVertex(NewVertex)

		return ResponseOpCodeParser().GetSuccessROPBuffer(HeepDevice, "Vertex Set")

	def ExecuteDeleteVertex(self, byteArray, HeepDevice) :
		counter = 1
		(numBytes,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(TxID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
		(RxID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
		(TxControl, counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(RxControl, counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)

		(IPOct1,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(IPOct2,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(IPOct3,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		(IPOct4,counter) = OpCodeUtilities().GetNumberFromMemory(byteArray, counter, 1)
		destinationIP = HeepIPAddress(IPOct1, IPOct2, IPOct3, IPOct4)

		NewVertex = Vertex()
		NewVertex.sourceID = TxID
		NewVertex.outputID = TxControl
		NewVertex.destinationID = RxID
		NewVertex.inputID = RxControl
		NewVertex.destinationIP = destinationIP

		HeepDevice.DeleteVertex(NewVertex)

		return ResponseOpCodeParser().GetSuccessROPBuffer(HeepDevice, "Vertex Deleted")

	def GetActionOpCodeFromByteArray(self, byteArray, HeepDevice) :

		#self.PrintDataAsByteArray(byteArray)

		AOpCode = byteArray[0]

		if AOpCode == self.IsHeepDeviceOpCode :
			return self.ExecuteIsHeepDevice(byteArray, HeepDevice)
		elif AOpCode == self.SetValueOpCode :
			return self.ExecuteSetValue(byteArray, HeepDevice)
		elif AOpCode == self.SetPositionOpCode :
			return self.ExecuteSetPosition(byteArray, HeepDevice)
		elif AOpCode == self.SetVertexOpCode :
			return self.ExecuteAddVertex(byteArray, HeepDevice)
		elif AOpCode == self.DeleteVertexOpCode :
			return self.ExecuteDeleteVertex(byteArray, HeepDevice)

		return ResponseOpCodeParser().GetErrorROPBuffer(HeepDevice, "HAPI COP Not Found") # No Opcode found

	def PrintDataAsByteArray(self, byteArray) :
		myArr = []
		for x in range(0, len(byteArray)) :
			myArr.append(byteArray[x])

		print myArr