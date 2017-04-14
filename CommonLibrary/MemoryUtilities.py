
from ControlValue import ControlValue
from Vertex import Vertex
from CommonDataTypes import HeepIPAddress
from OpCodeUtilities import OpCodeUtilities

class MemoryData:

	counter = 0
	deviceID = 0
	data = 0

	def __init__(self):
		return

class MemoryUtilities:

	OpCodeVersion = 1
	DeviceDataOpCode = chr(0x01)
	ControlDataOpCode = chr(0x02)
	VertexOpCode = chr(0x03)
	IconIDOpCode = chr(0x04)
	IconDataOpCode = chr(0x05)
	DeviceNameOpCode = chr(0x06)
	XYPositionOpCode = chr(0x07)
	IPAddressOPCode = chr(0x08)
	FragmentOpCode = chr(0x12)

	OpCodeUtilities = OpCodeUtilities()

	def __init__(self):
		return

	###########################################################
	########### UTILITY FUNCTIONS #############################
	###########################################################

	def GetNumberFromMemory(self, byteArray, counter, numBytes) :
		return self.OpCodeUtilities.GetNumberFromMemory(byteArray, counter, numBytes)

	def SkipOpCode(self, byteArray, counter) :
		counter += 5 # This skips the Device ID and lands on the bytes to skip

		bytesToSkip = ord(byteArray[counter])
		counter += bytesToSkip + 1

		return counter

	def GetConstantSizeByteArrayFromValue(self, value, size) :
		byteArray = []

		numBytes = OpCodeUtilities().GetNecessaryBytes(value)

		byteArray = OpCodeUtilities().GetByteArrayFromValue(value)

		for x in range(0, size-numBytes) :
			byteArray.insert(0, chr(0x00))

		return byteArray


	##############################################################
	##################Op Code Functions###########################
	##############################################################

	def AppendVertexDataToByteArray(self, byteArray, vertex) :

		byteArray.append(self.VertexOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, vertex.sourceID)
		byteArray.append(chr(10))
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, vertex.destinationID)
		byteArray.append(chr(vertex.outputID))
		byteArray.append(chr(vertex.inputID))

		IPBytes = vertex.destinationIP.GetIPAsByteArray()
		byteArray = self.AppendByteArrayToByteArray(byteArray, IPBytes)

		return byteArray

	def ReadVertexOpCode(self, byteArray, counter) :
		counter = counter+1

		(sourceID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)

		(numBytes, counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		(destinationID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)

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

	def GetVertexInfoFromByteArray(self, byteArray, deviceID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.VertexOpCode :
				capturedVertex = self.ReadVertexOpCode(byteArray, counter)
				counter = capturedVertex.counter
				capturedDevice = capturedVertex.deviceID
				
				if capturedDevice == deviceID :
					return capturedVertex

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return MemoryData()

	def GetVertexFromByteArray(self, byteArray, deviceID) :
		vertexInfo = self.GetVertexInfoFromByteArray(byteArray, deviceID)
		return vertexInfo.data

	def DeleteOpCode(self, byteArray, counter) :
		byteArray[counter] = self.FragmentOpCode
		return byteArray

	def DeleteVertexFromByteArray(self, byteArray, vertex) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.VertexOpCode :
				capturedVertex = self.ReadVertexOpCode(byteArray, counter)
				if vertex.IsVertexEqual(capturedVertex.data) :
					return self.DeleteOpCode(byteArray, counter)

				counter = capturedVertex.counter

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return byteArray

	def AppendIPAddressToByteArray(self, byteArray, deviceID, IPAddress) :
		byteArray.append(self.IPAddressOPCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, deviceID)
		byteArray.append(chr(4))

		IPArray = IPAddress.GetIPAsByteArray()
		byteArray = self.AppendByteArrayToByteArray(byteArray, IPArray)

		return byteArray

	def ReadIPAddressOPCode(self, byteArray, counter) :
		counter = counter+1
		(clientID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
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


	def GetIPAddressInfoFromByteArray(self, byteArray, deviceID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.IPAddressOPCode :
				capturedIP = self.ReadIPAddressOPCode(byteArray, counter)
				counter = capturedIP.counter
				capturedDevice = capturedIP.deviceID
				
				if capturedDevice == deviceID :
					return capturedIP

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return MemoryData()

	def GetIPAddressFromByteArray(self, byteArray, deviceID) :
		IPInfo = self.GetIPAddressInfoFromByteArray(byteArray, deviceID)
		return IPInfo.data

	def AppendIconIDToByteArray(self, byteArray, deviceID, IconID) :
		byteArray.append(self.IconIDOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, deviceID)
		byteArray.append(chr(1))
		byteArray.append(chr(IconID))

		return byteArray

	def ReadIconIDOpCode(self, byteArray, counter) :
		counter += 1

		(deviceID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
		(numBytes, counter) = self.GetNumberFromMemory(byteArray, counter, 1)	
		(IconID ,counter) = self.GetNumberFromMemory(byteArray, counter, 1)

		RetData = MemoryData()
		RetData.counter = counter
		RetData.deviceID = deviceID
		RetData.data = IconID

		return RetData

	def GetIconIDInfoFromByteArray(self, byteArray, deviceID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.IconIDOpCode :
				capturedIconID = self.ReadIconIDOpCode(byteArray, counter)
				counter = capturedIconID.counter
				capturedDevice = capturedIconID.deviceID
				
				if capturedDevice == deviceID :
					return capturedIconID

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return MemoryData()

	def GetIconIDFromByteArray(self, byteArray, deviceID) :
		IconIDInfo = self.GetIconIDInfoFromByteArray(byteArray, deviceID)
		return IconIDInfo.data

	def AppendIconDataToByteArray(self, byteArray, deviceID, IconData) :
		byteArray.append(self.IconDataOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, deviceID)
		byteArray.append(chr(len(IconData))) # Expect Icon Data in byte array form
		byteArray = self.AppendByteArrayToByteArray(byteArray, IconData) # Expect Icon Data in byte array form

		return byteArray

	def ReadIconDataOpCode(self, byteArray, counter) :
		counter += 1

		(deviceID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
		(numBytes, counter) = self.GetNumberFromMemory(byteArray, counter, 1)	

		iconData = []
		for x in range(0, numBytes) :
			(curData, counter) = self.GetNumberFromMemory(byteArray, counter, 1)
			iconData.append(chr(curData))

		RetData = MemoryData()
		RetData.counter = counter
		RetData.deviceID = deviceID
		RetData.data = iconData

		return RetData

	def GetIconDataInfoFromByteArray(self, byteArray, deviceID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.IconDataOpCode :
				capturedIconData = self.ReadIconDataOpCode(byteArray, counter)
				counter = capturedIconData.counter
				capturedDevice = capturedIconData.deviceID
				
				if capturedDevice == deviceID :
					return capturedIconData

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return MemoryData()

	def GetIconDataFromByteArray(self, byteArray, deviceID) :
		IconDataInfo = self.GetIconDataInfoFromByteArray(byteArray, deviceID)
		return IconDataInfo.data

	def AppendDeviceDataToByteArray(self, byteArray, deviceID) :

		byteArray.append(self.DeviceDataOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, deviceID)
		versionByteArray = OpCodeUtilities().GetByteArrayFromValue(self.OpCodeVersion)
		byteArray.append(chr(len(versionByteArray)))

		for x in range(0, len(versionByteArray)) :
			byteArray.append(versionByteArray[x])

		return byteArray

	def AppendDeviceXYToByteArray(self, byteArray, xValue, yValue, deviceID) :
		byteArray.append(self.XYPositionOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, deviceID)
		byteArray.append(chr(0x04)) # 4 bytes total in XY info
		byteArray = self.AppendByteArrayToByteArray(byteArray, self.GetConstantSizeByteArrayFromValue(xValue, 2))
		byteArray = self.AppendByteArrayToByteArray(byteArray, self.GetConstantSizeByteArrayFromValue(yValue, 2))

		return byteArray

	def OverwriteDeviceXYInByteArray(self, byteArray, xValue, yValue, counter) :
		xByteArray = self.GetConstantSizeByteArrayFromValue(xValue, 2)
		yByteArray = self.GetConstantSizeByteArrayFromValue(yValue, 2)
		
		byteArray[counter - 1] = yByteArray[1]
		byteArray[counter - 2] = yByteArray[0]
		byteArray[counter - 3] = xByteArray[1]
		byteArray[counter - 4] = xByteArray[0]

		return byteArray

	def ReadXYOpcode(self, byteArray, counter) :
		counter = counter+1

		deviceIDAndCounter = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
		counter = deviceIDAndCounter[1]
		deviceID = deviceIDAndCounter[0]

		counter +=1
		valueAndCounter = self.GetNumberFromMemory(byteArray, counter, 2)
		xValue = valueAndCounter[0]
		counter = valueAndCounter[1]

		valueAndCounter = self.GetNumberFromMemory(byteArray, counter, 2)
		yValue = valueAndCounter[0]
		counter = valueAndCounter[1]

		return (counter, deviceID, xValue, yValue)

	def GetDeviceXYInfo(self, ByteArray, deviceID) :
		counter = 0
		while counter < len(ByteArray) :
			if ByteArray[counter] == self.XYPositionOpCode :
				capturedXY = self.ReadXYOpcode(ByteArray, counter)
				counter = capturedXY[0]
				capturedDevice = capturedXY[1]
				
				if capturedDevice == deviceID :
					return capturedXY

			else :
				counter = self.SkipOpCode(ByteArray,counter)

		return (0, 0, -1, -1)

	def SetDeviceXY(self, byteArray, xValue, yValue, deviceID) :

		DeviceXYInfo = self.GetDeviceXYInfo(byteArray, deviceID)

		if DeviceXYInfo[2] == -1 and DeviceXYInfo[3] == -1 :
			byteArray = self.AppendDeviceXYToByteArray(byteArray, xValue, yValue, deviceID)
		else :
			counter = DeviceXYInfo[0]
			byteArray = self.OverwriteDeviceXYInByteArray(byteArray, xValue, yValue, counter)

		return byteArray

	def SetDeviceName(self, byteArray, deviceName, deviceID) :
		byteArray.append(self.DeviceNameOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, deviceID)
		byteArray.append(chr(len(deviceName)))
		byteArray = OpCodeUtilities().AppendStringToByteArray(byteArray, deviceName)

		return byteArray

	def ReadDeviceNameOpCode(self, byteArray, counter) :

		counter = counter+1

		deviceIDAndCounter = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
		counter = deviceIDAndCounter[1]
		deviceID = deviceIDAndCounter[0]

		byteLength = ord(byteArray[counter])

		counter = counter + 1
		deviceName = ""
		for x in range(0, byteLength) :
			deviceName += byteArray[counter]
			counter = counter + 1

		return (counter, deviceID, deviceName) 

	def GetDeviceNameInfo(self, byteArray, deviceID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.DeviceNameOpCode :
				capturedName = self.ReadDeviceNameOpCode(byteArray, counter)
				counter = capturedName[0]

				if capturedName[1] == deviceID :
					return capturedName

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return (0, 0, 'None')

	
	def ReadDeviceDataOpCode(self, byteArray, counter) :
		counter = counter+1

		deviceIDAndCounter = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)
		counter = deviceIDAndCounter[1]
		deviceID = deviceIDAndCounter[0]

		counter +=1
		valueAndCounter = self.GetNumberFromMemory(byteArray, counter, 1)
		firmwareValue = valueAndCounter[0]
		counter = valueAndCounter[1]

		return (counter, deviceID, firmwareValue)


	def GetDeviceFirmware(self, byteArray, deviceID) :
		deviceInfo = self.GetDeviceFirmwareInfo(byteArray, deviceID)

		return (deviceInfo[2])


	def GetDeviceFirmwareInfo(self, byteArray, deviceID) :
		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.DeviceDataOpCode :
				capturedFirmware = self.ReadDeviceDataOpCode(byteArray, counter)
				counter = capturedFirmware[0]
				capturedDevice = capturedFirmware[1]
				
				if capturedDevice == deviceID :
					return capturedFirmware

			else :
				counter = self.SkipOpCode(byteArray, counter)

		return (0, 0, -1)



	def ReadControlDataOpCode(self, byteArray, counter) :
		counter = counter+1

		(deviceID, counter) = OpCodeUtilities().GetDeviceIDFromMemory(byteArray, counter)

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
		RetData.deviceID = deviceID
		RetData.data = NewControlVal

		return RetData


	def GetDeviceControlValue(self, byteArray, deviceID) :
		deviceInfo = self.GetDeviceControlValueInfo(byteArray, deviceID)

		controlList = []
		for x in range(0, len(deviceInfo)) :
			controlList.append(deviceInfo[x].data)

		return controlList


	def GetDeviceControlValueInfo(self, byteArray, deviceID) :
		controlValuesFound = []

		counter = 0
		while counter < len(byteArray) :
			if byteArray[counter] == self.ControlDataOpCode :
				capturedControlValue = self.ReadControlDataOpCode(byteArray, counter)
				counter = capturedControlValue.counter
				capturedDevice = capturedControlValue.deviceID
				
				if capturedDevice == deviceID :
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

	def AppendControlDataToByteArray(self, byteArray, deviceID, control) :
		byteArray.append(self.ControlDataOpCode)
		byteArray = OpCodeUtilities().AppendDeviceIDToByteArray(byteArray, deviceID)

		bytesPerArgument = self.GetBytesPerArgumentForControlType(control.ControlValueType)

		numBytes = 3 + 3*bytesPerArgument + len(control.ControlName)

		byteArray.append(chr(numBytes))
		byteArray.append(chr(control.ControlID))
		byteArray.append(chr(control.ControlValueType))
		byteArray.append(chr(control.ControlDirection))

		byteArray.append(chr(control.LowValue))
		byteArray.append(chr(control.HighValue))
		byteArray.append(chr(control.CurCtrlValue))

		byteArray = OpCodeUtilities().AppendStringToByteArray(byteArray, control.ControlName)

		return byteArray
