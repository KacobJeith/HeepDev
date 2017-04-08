class Vertex:

	inputID = 0
	outputID = 0
	destinationID = 0
	destinationIP = ""
	sourceID = 0
	vertexID = 0

	def __init__(self):
		return

	def GetVertexString(self) :
		myStr = str(self.inputID) + ',' + str(self.outputID) + ',' + self.destinationIP + ',' + str(self.destinationID) + ',' + str(self.sourceID) + ',' + str(self.vertexID) + ';'
		return myStr

	def SetVertexFromString(self, inputStr) :
		splitString = inputStr.split(',')
		self.inputID = int(splitString[0])
		self.outputID = int(splitString[1])
		self.destinationIP = splitString[2]
		self.destinationID = int(splitString[3])
		self.sourceID = int(splitString[4])
		self.vertexID = int(splitString[5])

	def PrepareForJSON(self) :
		self.inputID = self.inputID
		self.outputID = self.outputID
		self.destinationIP = self.destinationIP
		self.destinationID = self.destinationID
		self.sourceID = self.sourceID
		self.vertexID = self.vertexID

	def FromDict(self, Dict) :
		self.__dict__ = Dict
