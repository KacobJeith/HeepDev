import json
from ControlValue import ControlValue
from Vertex import Vertex
from OutputData import OutputData

class PLCClient:

	def __init__(self):
		self.ClientID = 12345678910
		self.ClientType = 1
		self.IPAddress = 'none'
		self.ClientName = 'none'
		self.Position = {'top': 0, 'left': 0}
		self.ControlList = []
		self.ControlQueue = []
		self.VertexList = []
		return

 	def AddVertexByString(self, vertexStr) :
 		newVertex = Vertex()
 		newVertex.SetVertexFromString(vertexStr)
 		self.VertexList.append(newVertex)

 	def AddVertex(self, vertex) :
 		self.VertexList.append(vertex)

 	def QueueOutput(self, outName, value) :
 		outputCommandQueue = []

 		for x in range(0, len(self.VertexList)) :
 			if outName == self.VertexList[x].outputName :
 				myOutput = OutputData(self.VertexList[x].inputName, self.VertexList[x].destinationID, self.VertexList[x].destinationIP, self.VertexList[x].sourceID, value)
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

	def UpdatePositionByString(self, positionString) :
		updatedPosition = positionString.split(',')
		self.UpdatePositionByName(float(updatedPosition[1], float(updatedPosition[2]))

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

	def GetClientString(self):
		myString = str(self.ClientID) + ',' + self.IPAddress + ',' + str(self.ClientType) + ',' + self.ClientName
		for x in range(0, len(self.ControlList)) :
			myString = myString + ',' + self.ControlList[x].GetControlValueString()
		return myString

	def SetClientFromString(self, clientString) :
		self.ControlList = []
		splitString = clientString.split(',')
		self.ClientID = int(splitString[0])
		self.IPAddress = splitString[1]
		self.ClientType = int(splitString[2])
		self.ClientName = splitString[3]

		it = 4
		while it < len(splitString) :
			control = ControlValue()
			it = control.SetControlFromSplitString(splitString, it)
			self.ControlList.append(control)

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

	def prepareForJSON(self) :
		self.ClientType = self.ClientType
		self.IPAddress = self.IPAddress
		self.ClientName = self.ClientName
		self.ControlList = self.ControlList
		self.ClientID = self.ClientID
		self.Position = self.Position

		for x in range(0, len(self.ControlList)) :
			self.ControlList[x].PrepareForJSONWrite()

		for x in range (0, len(self.VertexList)) :
			self.VertexList[x].PrepareForJSON()

	def toJSON(self):
		self.prepareForJSON()
		return json.dumps(self, default=lambda o: o.__dict__, sort_keys=True, indent=4, separators=(',', ': '))

	def toJSONDict(self) :
		return json.loads(self.toJSON())

	def fromJSON(self, Data) :
		self.fromDict(json.loads(Data))

	def fromDict(self, Dict) :
		self.__dict__ = Dict
		tempControlList = self.ControlList
		self.ControlList = []
		for x in range(0, len(tempControlList)) :
			newControl = ControlValue()
			newControl.FromDict(tempControlList[x])
			self.ControlList.append(newControl)

		tempVertexList = self.VertexList
		self.VertexList = []
		for x in range(0, len(tempVertexList)) :
			newVertex = Vertex()
			newVertex.FromDict(tempVertexList[x])
			self.VertexList.append(newVertex)
