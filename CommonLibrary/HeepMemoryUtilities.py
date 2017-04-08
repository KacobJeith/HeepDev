from ControlValue import ControlValue
from Vertex import Vertex

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
	ClientNameOpCode = chr(0x06)
	XYPositionOpCode = chr(0x07)

	def __init__(self):
		return

	###########################################################
	########### UTILITY FUNCTIONS #############################
	###########################################################
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


	def GetNumberFromMemory(self, byteArray, counter, numBytes) :

		retVal = 0

		byteCounter = numBytes - 1
		for x in range(0, numBytes) :
			curVal = ord(byteArray[counter]) << (8*byteCounter)
			byteCounter -= 1
			retVal += curVal
			counter += 1

		return (retVal, counter)

	def GetClientIDFromMemory(self, byteArray, counter) :

		clientIDAndCounter = self.GetNumberFromMemory(byteArray, counter, 4)

		return clientIDAndCounter


	def GetNumberFromMemory(self, byteArray, counter, numBytes) :

		retVal = 0

		byteCounter = numBytes - 1
		for x in range(0, numBytes) :
			curVal = ord(byteArray[counter]) << (8*byteCounter)
			byteCounter -= 1
			retVal += curVal
			counter += 1

		return (retVal, counter)


	def GetConstantSizeByteArrayFromValue(self, value, size) :
		byteArray = []

		numBytes = self.GetNecessaryBytes(value)

		byteArray = self.GetByteArrayFromValue(value)

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
		byteArray = self.AppendClientIDToByteArray(byteArray, vertex.sourceID)
		byteArray.append(chr(11))
		byteArray = self.AppendClientIDToByteArray(byteArray, vertex.destinationID)
		byteArray.append(chr(vertex.inputID))
		byteArray.append(chr(vertex.outputID))
		byteArray.append(chr(vertex.vertexID))
		splitIP = vertex.destinationIP.split('.')
		IPOct1 = int(splitIP[3])
		IPOct2 = int(splitIP[2])
		IPOct3 = int(splitIP[1])
		IPOct4 = int(splitIP[0])
		byteArray.append(chr(IPOct1))
		byteArray.append(chr(IPOct2))
		byteArray.append(chr(IPOct3))
		byteArray.append(chr(IPOct4))

		return byteArray

	def AppendClientDataToByteArray(self, byteArray, clientID) :

		byteArray.append(self.ClientDataOpCode)
		byteArray = self.AppendClientIDToByteArray(byteArray, clientID)
		versionByteArray = self.GetByteArrayFromValue(self.OpCodeVersion)
		byteArray.append(chr(len(versionByteArray)))

		for x in range(0, len(versionByteArray)) :
			byteArray.append(versionByteArray[x])

		return byteArray

	def AppendClientXYToByteArray(self, byteArray, xValue, yValue, clientID) :
		byteArray.append(self.XYPositionOpCode)
		byteArray = self.AppendClientIDToByteArray(byteArray, clientID)
		byteArray.append(chr(0x04)) # 4 bytes total in XY info
		self.AppendByteArrayToByteArray(byteArray, self.GetConstantSizeByteArrayFromValue(xValue, 2))
		self.AppendByteArrayToByteArray(byteArray, self.GetConstantSizeByteArrayFromValue(yValue, 2))

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
			self.AppendClientXYToByteArray(byteArray, xValue, yValue, clientID)
		else :
			counter = clientXYInfo[0]
			self.OverwriteClientXYInByteArray(byteArray, xValue, yValue, counter)

		return byteArray

	def SetClientName(self, byteArray, clientName, clientID) :
		byteArray.append(self.ClientNameOpCode)
		byteArray = self.AppendClientIDToByteArray(byteArray, clientID)
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

		clientIDAndCounter = self.GetClientIDFromMemory(byteArray, counter)
		counter = clientIDAndCounter[1]
		clientID = clientIDAndCounter[0]

		numBytes = ord( byteArray[counter] )
		counter +=1

		ControlID = ord( byteArray[counter] )
		counter +=1

		ControlType = ord( byteArray[counter] )
		counter +=1

		ControlDirection = ord( byteArray[counter] )
		counter +=1

		LowValue = ord( byteArray[counter] )
		counter +=1

		HighValue = ord( byteArray[counter] )
		counter +=1

		CurCtrlValue = ord( byteArray[counter] )
		counter +=1

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
		return clientInfo.data


	def GetClientControlValueInfo(self, byteArray, clientID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.ControlDataOpCode :
				capturedControlValue = self.ReadControlDataOpCode(byteArray, counter)
				counter = capturedControlValue.counter
				capturedClient = capturedControlValue.clientID
				
				if capturedClient == clientID :
					return capturedControlValue

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return MemoryData()

	def AppendByteArrayToByteArray(self, byteArray, byteArrayToBeAppended) :
		for x in range(0, len(byteArrayToBeAppended)) :
			byteArray.append(byteArrayToBeAppended[x])

		return byteArray

	def GetBytesPerArgumentForControlType(self, controlType) :
		if controlType == 0 or controlType == 1 :
			return 1

	def AppendControlDataToByteArray(self, byteArray, clientID, control) :
		byteArray.append(self.ControlDataOpCode)
		byteArray = self.AppendClientIDToByteArray(byteArray, clientID)

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
