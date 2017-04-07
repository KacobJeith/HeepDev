from ControlValue import ControlValue

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
	ClientNameOpCode = chr(0x06)
	XYPositionOpCode = chr(0x07)

	def __init__(self):
		return

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

	def AppendClientDataToByteArray(self, byteArray, clientID) :

		byteArray.append(self.ClientDataOpCode)
		byteArray = self.AppendClientIDToByteArray(byteArray, clientID)
		versionByteArray = self.GetByteArrayFromValue(self.OpCodeVersion)
		byteArray.append(chr(len(versionByteArray)))

		for x in range(0, len(versionByteArray)) :
			byteArray.append(versionByteArray[x])

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

		DylansFukboi = ControlValue()
		DylansFukboi.ControlName = ControlName
		DylansFukboi.ControlValueType = ControlType
		DylansFukboi.ControlID = ControlID
		DylansFukboi.ControlDirection = ControlDirection
		DylansFukboi.HighValue = HighValue
		DylansFukboi.LowValue = LowValue
		DylansFukboi.CurCtrlValue = CurCtrlValue

		RetData = MemoryData()
		RetData.counter = counter
		RetData.clientID = clientID
		RetData.data = DylansFukboi

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