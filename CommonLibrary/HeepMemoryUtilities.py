from ControlValue import ControlValue
from Vertex import Vertex
from CommonDataTypes import HeepIPAddress
from HeepOpCodeUtilities import HeepOpCodeUtilities

class MemoryData:

	counter = 0
	clientID = 0
	data = 0

	def __init__(self):
		return

class HeepMemoryUtilities:

	OpCodeVersion = 1
	ClientDataOpCode = chr(0x01)
	ControlDataOpCode = chr(0x02)
	VertexOpCode = chr(0x03)
	IconIDOpCode = chr(0x04)
	IconDataOpCode = chr(0x05)
	ClientNameOpCode = chr(0x06)
	XYPositionOpCode = chr(0x07)
	IPAddressOPCode = chr(0x08)

	OpCodeUtilities = HeepOpCodeUtilities()

	def __init__(self):
		return

	###########################################################
	########### UTILITY FUNCTIONS #############################
	###########################################################
	def ConvertStringToByteArray(self, string) :
		byteArray = []
		for x in range(0, len(string)) :
			byteArray.append(string[x])

		return byteArray

	def GetNumberFromMemory(self, byteArray, counter, numBytes) :
		return self.OpCodeUtilities.GetNumberFromMemory(byteArray, counter, numBytes)

	def AppendStringToByteArray(self, byteArray, theString) :
		for x in range(0, len(theString)) :
			byteArray.append(theString[x])

		return byteArray

	def SkipOpCode(self, byteArray, counter) :
		counter += 5 # This skips the Client ID and lands on the bytes to skip

		bytesToSkip = ord(byteArray[counter])
		counter += bytesToSkip + 1

		return counter

	def GetClientIDFromMemory(self, byteArray, counter) :

		clientIDAndCounter = self.GetNumberFromMemory(byteArray, counter, 4)

		return clientIDAndCounter


	def GetClientIDFromMemory(self, byteArray, counter) :

		clientIDAndCounter = self.GetNumberFromMemory(byteArray, counter, 4)

		return clientIDAndCounter


	def GetConstantSizeByteArrayFromValue(self, value, size) :
		byteArray = []

		numBytes = HeepOpCodeUtilities().GetNecessaryBytes(value)

		byteArray = HeepOpCodeUtilities().GetByteArrayFromValue(value)

		for x in range(0, size-numBytes) :
			byteArray.insert(0, chr(0x00))

		return byteArray

	def GetStringFromByteArray(self, byteArray) :
		myString = ""

		for x in range(0, len(byteArray)) :
			myString = myString + str(byteArray[x])

		return myString


	##############################################################
	##################Op Code Functions###########################
	##############################################################

	def AppendVertexDataToByteArray(self, byteArray, vertex) :

		byteArray.append(self.VertexOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, vertex.sourceID)
		byteArray.append(chr(10))
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, vertex.destinationID)
		byteArray.append(chr(vertex.outputID))
		byteArray.append(chr(vertex.inputID))

		IPBytes = vertex.destinationIP.GetIPAsByteArray()
		byteArray = self.AppendByteArrayToByteArray(byteArray, IPBytes)

		return byteArray

	def ReadVertexOpCode(self, byteArray, counter) :
		counter = counter+1

		(sourceID, counter) = self.GetClientIDFromMemory(byteArray, counter)

		(numBytes, counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		(destinationID, counter) = self.GetClientIDFromMemory(byteArray, counter)

		(outputID, counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(inputID, counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		(IPOct1,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(IPOct2,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(IPOct3,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(IPOct4,counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		NewVertex = Vertex()
		NewVertex.inputID = inputID
		NewVertex.sourceID = sourceID
		NewVertex.outputID = outputID
		NewVertex.destinationID = destinationID
		NewVertex.destinationIP = HeepIPAddress(IPOct1, IPOct2, IPOct3, IPOct4)

		RetData = MemoryData()
		RetData.counter = counter
		RetData.clientID = sourceID
		RetData.data = NewVertex

		return RetData

	def GetVertexInfoFromByteArray(self, byteArray, clientID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.VertexOpCode :
				capturedVertex = self.ReadVertexOpCode(byteArray, counter)
				counter = capturedVertex.counter
				capturedClient = capturedVertex.clientID
				
				if capturedClient == clientID :
					return capturedVertex

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return MemoryData()

	def GetVertexFromByteArray(self, byteArray, clientID) :
		vertexInfo = self.GetVertexInfoFromByteArray(byteArray, clientID)
		return vertexInfo.data

	def AppendIPAddressToByteArray(self, byteArray, clientID, IPAddress) :
		byteArray.append(self.IPAddressOPCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, clientID)
		byteArray.append(chr(4))

		IPArray = IPAddress.GetIPAsByteArray()
		byteArray = self.AppendByteArrayToByteArray(byteArray, IPArray)

		return byteArray

	def ReadIPAddressOPCode(self, byteArray, counter) :
		counter = counter+1
		(clientID, counter) = self.GetClientIDFromMemory(byteArray, counter)
		(numBytes, counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		(IPOct1,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(IPOct2,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(IPOct3,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(IPOct4,counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		IPAddr = HeepIPAddress(IPOct1, IPOct2, IPOct3, IPOct4)

		RetData = MemoryData()
		RetData.counter = counter
		RetData.clientID = clientID
		RetData.data = IPAddr

		return RetData


	def GetIPAddressInfoFromByteArray(self, byteArray, clientID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.IPAddressOPCode :
				capturedIP = self.ReadIPAddressOPCode(byteArray, counter)
				counter = capturedIP.counter
				capturedClient = capturedIP.clientID
				
				if capturedClient == clientID :
					return capturedIP

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return MemoryData()

	def GetIPAddressFromByteArray(self, byteArray, clientID) :
		IPInfo = self.GetIPAddressInfoFromByteArray(byteArray, clientID)
		return IPInfo.data

	def AppendIconIDToByteArray(self, byteArray, clientID, IconID) :
		byteArray.append(self.IconIDOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, clientID)
		byteArray.append(chr(1))
		byteArray.append(chr(IconID))

		return byteArray

	def ReadIconIDOpCode(self, byteArray, counter) :
		counter += 1

		(clientID, counter) = self.GetClientIDFromMemory(byteArray, counter)
		(numBytes, counter) = self.GetNumberFromMemory(byteArray, counter, 1)	
		(IconID ,counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		RetData = MemoryData()
		RetData.counter = counter
		RetData.clientID = clientID
		RetData.data = IconID

		return RetData

	def GetIconIDInfoFromByteArray(self, byteArray, clientID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.IconIDOpCode :
				capturedIconID = self.ReadIconIDOpCode(byteArray, counter)
				counter = capturedIconID.counter
				capturedClient = capturedIconID.clientID
				
				if capturedClient == clientID :
					return capturedIconID

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return MemoryData()

	def GetIconIDFromByteArray(self, byteArray, clientID) :
		IconIDInfo = self.GetIconIDInfoFromByteArray(byteArray, clientID)
		return IconIDInfo.data

	def AppendIconDataToByteArray(self, byteArray, clientID, IconData) :
		byteArray.append(self.IconDataOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, clientID)
		byteArray.append(chr(len(IconData))) # Expect Icon Data in byte array form
		byteArray = self.AppendByteArrayToByteArray(byteArray, IconData) # Expect Icon Data in byte array form

		return byteArray

	def ReadIconDataOpCode(self, byteArray, counter) :
		counter += 1

		(clientID, counter) = self.GetClientIDFromMemory(byteArray, counter)
		(numBytes, counter) = self.GetNumberFromMemory(byteArray, counter, 1)	

		iconData = []
		for x in range(0, numBytes) :
			(curData, counter) = self.GetNumberFromMemory(byteArray, counter, 1)
			iconData.append(chr(curData))

		RetData = MemoryData()
		RetData.counter = counter
		RetData.clientID = clientID
		RetData.data = iconData

		return RetData

	def GetIconDataInfoFromByteArray(self, byteArray, clientID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.IconDataOpCode :
				capturedIconData = self.ReadIconDataOpCode(byteArray, counter)
				counter = capturedIconData.counter
				capturedClient = capturedIconData.clientID
				
				if capturedClient == clientID :
					return capturedIconData

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return MemoryData()

	def GetIconDataFromByteArray(self, byteArray, clientID) :
		IconDataInfo = self.GetIconDataInfoFromByteArray(byteArray, clientID)
		return IconDataInfo.data

	def AppendClientDataToByteArray(self, byteArray, clientID) :

		byteArray.append(self.ClientDataOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, clientID)
		versionByteArray = HeepOpCodeUtilities().GetByteArrayFromValue(self.OpCodeVersion)
		byteArray.append(chr(len(versionByteArray)))

		for x in range(0, len(versionByteArray)) :
			byteArray.append(versionByteArray[x])

		return byteArray

	def AppendClientXYToByteArray(self, byteArray, xValue, yValue, clientID) :
		byteArray.append(self.XYPositionOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, clientID)
		byteArray.append(chr(0x04)) # 4 bytes total in XY info
		byteArray = self.AppendByteArrayToByteArray(byteArray, self.GetConstantSizeByteArrayFromValue(xValue, 2))
		byteArray = self.AppendByteArrayToByteArray(byteArray, self.GetConstantSizeByteArrayFromValue(yValue, 2))

		return byteArray

	def OverwriteClientXYInByteArray(self, byteArray, xValue, yValue, counter) :
		xByteArray = self.GetConstantSizeByteArrayFromValue(xValue, 2)
		yByteArray = self.GetConstantSizeByteArrayFromValue(yValue, 2)
		
		byteArray[counter - 1] = yByteArray[1]
		byteArray[counter - 2] = yByteArray[0]
		byteArray[counter - 3] = xByteArray[1]
		byteArray[counter - 4] = xByteArray[0]

		return byteArray

	def ReadXYOpcode(self, byteArray, counter) :
		counter = counter+1

		clientIDAndCounter = self.GetClientIDFromMemory(byteArray, counter)
		counter = clientIDAndCounter[1]
		clientID = clientIDAndCounter[0]

		counter +=1
		valueAndCounter = self.GetNumberFromMemory(byteArray, counter, 2)
		xValue = valueAndCounter[0]
		counter = valueAndCounter[1]

		valueAndCounter = self.GetNumberFromMemory(byteArray, counter, 2)
		yValue = valueAndCounter[0]
		counter = valueAndCounter[1]

		return (counter, clientID, xValue, yValue)

	def GetClientXYInfo(self, ByteArray, clientID) :
		counter = 0
		while counter < len(ByteArray) :
			if ByteArray[counter] == self.XYPositionOpCode :
				capturedXY = self.ReadXYOpcode(ByteArray, counter)
				counter = capturedXY[0]
				capturedClient = capturedXY[1]
				
				if capturedClient == clientID :
					return capturedXY

			else :
				counter = self.SkipOpCode(ByteArray,counter)

		return (0, 0, -1, -1)

	def SetClientXY(self, byteArray, xValue, yValue, clientID) :

		clientXYInfo = self.GetClientXYInfo(byteArray, clientID)

		if clientXYInfo[2] == -1 and clientXYInfo[3] == -1 :
			byteArray = self.AppendClientXYToByteArray(byteArray, xValue, yValue, clientID)
		else :
			counter = clientXYInfo[0]
			byteArray = self.OverwriteClientXYInByteArray(byteArray, xValue, yValue, counter)

		return byteArray

	def SetClientName(self, byteArray, clientName, clientID) :
		byteArray.append(self.ClientNameOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, clientID)
		byteArray.append(chr(len(clientName)))
		byteArray = self.AppendStringToByteArray(byteArray, clientName)

		return byteArray

	def ReadClientNameOpCode(self, byteArray, counter) :

		counter = counter+1

		clientIDAndCounter = self.GetClientIDFromMemory(byteArray, counter)
		counter = clientIDAndCounter[1]
		clientID = clientIDAndCounter[0]

		byteLength = ord(byteArray[counter])

		counter = counter + 1
		clientName = ""
		for x in range(0, byteLength) :
			clientName += byteArray[counter]
			counter = counter + 1

		return (counter, clientID, clientName) 

	def GetClientNameInfo(self, byteArray, clientID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.ClientNameOpCode :
				capturedName = self.ReadClientNameOpCode(byteArray, counter)
				counter = capturedName[0]

				if capturedName[1] == clientID :
					return capturedName

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return (0, 0, 'None')

	





	def ReadClientDataOpCode(self, byteArray, counter) :
		counter = counter+1

		clientIDAndCounter = self.GetClientIDFromMemory(byteArray, counter)
		counter = clientIDAndCounter[1]
		clientID = clientIDAndCounter[0]

		counter +=1
		valueAndCounter = self.GetNumberFromMemory(byteArray, counter, 1)
		firmwareValue = valueAndCounter[0]
		counter = valueAndCounter[1]

		return (counter, clientID, firmwareValue)


	def GetClientFirmware(self, byteArray, clientID) :
		clientInfo = self.GetClientFirmwareInfo(byteArray, clientID)

		return (clientInfo[2])


	def GetClientFirmwareInfo(self, byteArray, clientID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.ClientDataOpCode :
				capturedFirmware = self.ReadClientDataOpCode(byteArray, counter)
				counter = capturedFirmware[0]
				capturedClient = capturedFirmware[1]
				
				if capturedClient == clientID :
					return capturedFirmware

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return (0, 0, -1)



	def ReadControlDataOpCode(self, byteArray, counter) :
		counter = counter+1

		(clientID, counter) = self.GetClientIDFromMemory(byteArray, counter)

		(numBytes,counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		(ControlID,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(ControlType,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(ControlDirection,counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		(LowValue,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(HighValue,counter) = self.GetNumberFromMemory(byteArray, counter, 1)
		(CurCtrlValue,counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		ControlName = ""

		for x in range(0, numBytes - 6) :
		    ControlName += byteArray[counter]
		    counter = counter + 1

		NewControlVal = ControlValue()
		NewControlVal.ControlName = ControlName
		NewControlVal.ControlValueType = ControlType
		NewControlVal.ControlID = ControlID
		NewControlVal.ControlDirection = ControlDirection
		NewControlVal.HighValue = HighValue
		NewControlVal.LowValue = LowValue
		NewControlVal.CurCtrlValue = CurCtrlValue

		RetData = MemoryData()
		RetData.counter = counter
		RetData.clientID = clientID
		RetData.data = NewControlVal

		return RetData


	def GetClientControlValue(self, byteArray, clientID) :
		clientInfo = self.GetClientControlValueInfo(byteArray, clientID)

		controlList = []
		for x in range(0, len(clientInfo)) :
			controlList.append(clientInfo[x].data)

		return controlList


	def GetClientControlValueInfo(self, byteArray, clientID) :
		controlValuesFound = []

		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.ControlDataOpCode :
				capturedControlValue = self.ReadControlDataOpCode(byteArray, counter)
				counter = capturedControlValue.counter
				capturedClient = capturedControlValue.clientID
				
				if capturedClient == clientID :
					controlValuesFound.append(capturedControlValue)

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return controlValuesFound

	def AppendByteArrayToByteArray(self, byteArray, byteArrayToBeAppended) :
		for x in range(0, len(byteArrayToBeAppended)) :
			byteArray.append(byteArrayToBeAppended[x])

		return byteArray

	def GetBytesPerArgumentForControlType(self, controlType) :
		if controlType == 0 or controlType == 1 :
			return 1

	def AppendControlDataToByteArray(self, byteArray, clientID, control) :
		byteArray.append(self.ControlDataOpCode)
		byteArray = HeepOpCodeUtilities().AppendClientIDToByteArray(byteArray, clientID)

		bytesPerArgument = self.GetBytesPerArgumentForControlType(control.ControlValueType)

		numBytes = 3 + 3*bytesPerArgument + len(control.ControlName)

		byteArray.append(chr(numBytes))
		byteArray.append(chr(control.ControlID))
		byteArray.append(chr(control.ControlValueType))
		byteArray.append(chr(control.ControlDirection))

		byteArray.append(chr(control.LowValue))
		byteArray.append(chr(control.HighValue))
		byteArray.append(chr(control.CurCtrlValue))

		byteArray = self.AppendStringToByteArray(byteArray, control.ControlName)

		return byteArray
