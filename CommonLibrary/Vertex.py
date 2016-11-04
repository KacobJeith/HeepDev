class Vertex:

	inputName = ""
	outputName = ""
	destinationID = 0
	destinationIP = ""
	sourceID = 0

	def __init__(self):
		return

	def GetVertexString(self) :
		myStr = self.inputName + ',' + self.outputName + ',' + self.destinationIP + ',' + str(self.destinationID) + ',' + str(self.sourceID)
		return myStr

	def SetVertexFromString(self, inputStr) :
		splitString = inputStr.split(',')
		self.inputName = splitString[0]
		self.outputName = splitString[1]
		self.destinationIP = splitString[2]
		self.destinationID = int(splitString[3])
		self.sourceID = int(splitString[4])

	def PrepareForJSON(self) :
		self.inputName = self.inputName
		self.outputName = self.outputName
		self.destinationIP = self.destinationIP
		self.destinationID = self.destinationID
		self.sourceID = self.sourceID
