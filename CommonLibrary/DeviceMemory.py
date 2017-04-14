from MemoryUtilities import MemoryUtilities

# This is simulated Device memory

class DeviceMemory:

	DeviceMemoryFileName = 'DeviceMemory.dat'

	def __init__(self):
		self.totalMemory = 1024 #In Bytes
		self.miscMemory = []
		return

	def WriteDeviceMemoryToFile(self) :
		writeFile = open(self.DeviceMemoryFileName, 'w')
		writeFile.write(self.GetMemoryString())
		writeFile.close()

	def SetDeviceXY(self, xValue, yValue, deviceID) :
		self.miscMemory = MemoryUtilities().SetDeviceXY(self.miscMemory, xValue, yValue, deviceID)

	def SetDeviceName(self, deviceName, deviceID) :
		self.miscMemory = MemoryUtilities().SetDeviceName(self.miscMemory, deviceName, deviceID)

	def SetIconIDAndData(self, iconID, iconData, deviceID) :
		self.miscMemory = MemoryUtilities().AppendIconIDToByteArray(self.miscMemory, deviceID, iconID)
		self.miscMemory = MemoryUtilities().AppendIconDataToByteArray(self.miscMemory, deviceID, iconData)

	def GetIconIDAndData(self, deviceID) :
		iconID = MemoryUtilities().GetIconIDFromByteArray(self.miscMemory, deviceID)
		iconData = sMemoryUtilities().GetIconDataFromByteArray(self.miscMemory, deviceID)

		return (iconID, iconData)

	def GetDeviceXY(self, deviceID) :
		deviceInfo = MemoryUtilities().GetDeviceXYInfo(self.miscMemory, deviceID)
		return (deviceInfo[2], deviceInfo[3])

	def GetDeviceName(self, deviceID) :
		deviceNameInfo = MemoryUtilities().GetDeviceNameInfo(self.miscMemory, deviceID)
		return deviceNameInfo[2]

	def SetVertex(self, vertex) :
		self.miscMemory = MemoryUtilities().AppendVertexDataToByteArray(self.miscMemory, vertex)

	def DeleteVertex(self, vertex) :
		
		self.miscMemory = MemoryUtilities().DeleteVertexFromByteArray(self.miscMemory, vertex)

	def SetIPAddress(self, deviceID, IPAddress) :
		self.miscMemory = MemoryUtilities().AppendIPAddressToByteArray(self.miscMemory, deviceID, IPAddress)

	def GetIPAddress(self, deviceID) :
		return MemoryUtilities().GetIPAddressFromByteArray(self.miscMemory, deviceID)

	def GetMemoryString(self) :
		return MemoryUtilities().GetStringFromByteArray(self.miscMemory)