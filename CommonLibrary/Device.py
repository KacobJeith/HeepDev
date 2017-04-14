import json
from ControlValue import ControlValue
from Vertex import Vertex
from OutputData import OutputData
from DeviceMemory import DeviceMemory
from MemoryUtilities import MemoryUtilities
from CommonDataTypes import HeepIPAddress
from OpCodeUtilities import OpCodeUtilities

class Device:

	def __init__(self):
		self.DeviceID = 12345678910
		self.IPAddress = HeepIPAddress(0, 0, 0, 0)
		self.DeviceName = 'none'
		self.IconCustom = 0
		self.IconName = 'none'
		self.ControlList = []
		self.ControlQueue = []
		self.VertexList = []
		self.DeviceMemory = DeviceMemory()
		return

	def SetFrontEndXY(self, deviceX, deviceY) :
		self.DeviceMemory.SetDeviceXY(deviceX, deviceY, self.DeviceID)

	def GetFrontEndXY(self) :
		return self.DeviceMemory.GetDeviceXY(self.DeviceID)

	def SetDeviceName(self, DeviceName) :
		self.DeviceName = DeviceName
		self.DeviceMemory.SetDeviceName(self.DeviceName, self.DeviceID)

	def DumpDeviceMemory(self) :
		self.DeviceMemory.WriteDeviceMemoryToFile()

 	def AddVertexByString(self, vertexStr) :
 		newVertex = Vertex()
 		newVertex.SetVertexFromString(vertexStr)
 		self.AddVertex(vertex)

 	def SetIconInformation(self, iconID, iconData) :
 		self.DeviceMemory.SetIconIDAndData(iconID, iconData, self.DeviceID)

 	def AddVertex(self, vertex) :
 		self.VertexList.append(vertex)
 		self.DeviceMemory.SetVertex(vertex)

 	def DeleteVertex(self, vertex) :
 		for x in range(0, len(self.VertexList)) :
 			if vertex.IsVertexEqual(self.VertexList[x]) :
 				self.VertexList.remove(self.VertexList[x])
 				break

 		self.DeviceMemory.DeleteVertex(vertex)

 	def SetIPAddress(self, IPAddress) :
 		self.DeviceMemory.SetIPAddress(self.DeviceID, IPAddress)

 	def GetIPAddress(self) :
 		return self.DeviceMemory.GetIPAddress(self.DeviceID)

 	def RemoveVertex(self, destID, outputID, inputID) :

 		for x in range(0, len(self.VertexList)) :
 			if (destID 		== self.VertexList[x].destinationID 	and 
 				outputID 	== self.VertexList[x].outputID 			and  
 				inputID 	== self.VertexList[x].inputID			) :

 				self.VertexList.remove(self.VertexList[x])
 				return self.GetVerticesString()

		return self.GetVerticesString()

 	def QueueOutput(self, outID, value) :
 		outputCommandQueue = []

 		for x in range(0, len(self.VertexList)) :
 			if outID == self.VertexList[x].outputID :
 				myOutput = OutputData(self.VertexList[x].inputID, self.VertexList[x].destinationID, self.VertexList[x].destinationIP, self.VertexList[x].sourceID, value)
 				outputCommandQueue.append(myOutput)

 		return outputCommandQueue

 	def QueueControlByName(self, name, ControlValue) :
 		for x in range(0, len(self.ControlList)) :
 			if self.ControlList[x].ControlName == name :
 				self.ControlList[x].CurCtrlValue = ControlValue
 				self.QueueControl(self.ControlList[x])
 				return

 		return

	def QueueControl(self, ControlVal) :
		for x in range(0, len(self.ControlQueue) ) :
			if self.ControlQueue[x][0] == ControlVal.ControlName :
				self.ControlQueue[x] = (ControlVal.ControlName, ControlVal.CurCtrlValue)
				return

		self.ControlQueue.append( (ControlVal.ControlName, ControlVal.CurCtrlValue) )
		return

	def UpdateControlByName(self, name, value) :
		for x in range(0, len(self.ControlList)) :
			if self.ControlList[x].ControlName == name :
				self.ControlList[x].CurCtrlValue = value
				return
		return

	def UpdateControlsByString(self, controlString) :
		controlList = controlString.split(';')

		for x in range(0, len(controlList)) :
			if len(controlList[x]) > 0:
				curCommand = controlList[x].split(',')
				self.UpdateControlByName(curCommand[0], int(curCommand[1]))

		return

	def UpdateControlsByID(self, controlID, Data) :
		for x in range(0, len(self.ControlList)) :
			if self.ControlList[x].ControlID == controlID :
				self.ControlList[x].CurCtrlValue = Data
				return 0 # Return 0 for success

		return 1 # Meantime return 1 for not found or error

	def UpdatePositionByString(self, positionString) :
		updatedPosition = positionString.split(',')
		self.UpdatePositionByName( float(updatedPosition[1]), float(updatedPosition[2]))

		return

	def UpdatePositionByName(self, top, left) :
		self.Position.top = top
		self.Position.left = left
		return

	def GetQueuedControlString(self) :
		retString = ""
		for x in range(0, len(self.ControlQueue)) :
			retString = retString + self.ControlQueue[x][0] + ',' + str(self.ControlQueue[x][1]) +';'

		self.ControlQueue = []
		return retString	

	def GetDeviceString(self):
		
		byteArray = self.GetDeviceByteArray()
		return OpCodeUtilities().GetStringFromByteArray(byteArray)
		
	def GetDeviceByteArray(self) :
		byteArray = []
		byteArray = MemoryUtilities().AppendDeviceDataToByteArray(byteArray, self.DeviceID)

		for x in range(0, len(self.ControlList)) :
			byteArray = MemoryUtilities().AppendControlDataToByteArray(byteArray, self.DeviceID, self.ControlList[x])

		
		byteArray = MemoryUtilities().AppendByteArrayToByteArray(byteArray, self.DeviceMemory.miscMemory)
		return byteArray


	def SetDeviceFromString(self, deviceString) :

		byteArray = OpCodeUtilities().ConvertStringToByteArray(deviceString)
		self.ControlList = MemoryUtilities().GetDeviceControlValue(byteArray, self.DeviceID)

	def GetVerticesString(self) :
		retStr = ""

		for x in range(0, len(self.VertexList)) :
			retStr = retStr + self.VertexList[x].GetVertexString()

		return retStr

	def SetVerticesFromString(self, vertexString) :
		self.VertexList = []
		splitStringSemiColon = vertexString.split(';')
		for x in range(0, len(splitStringSemiColon)) :
			if len(splitStringSemiColon[x]) > 0 :
				newVertex = Vertex()
				newVertex.SetVertexFromString(splitStringSemiColon[x])
				self.VertexList.append(newVertex)
		return
