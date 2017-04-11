from CommonDataTypes import HeepIPAddress

class Vertex:

	inputID = 0
	outputID = 0
	destinationID = 0
	destinationIP = HeepIPAddress(0,0,0,0)
	sourceID = 0

	def __init__(self):
		return

	def GetVertexString(self) :
		myStr = str(self.inputID) + ',' + str(self.outputID) + ',' + self.destinationIP.GetIPAsString() + ',' + str(self.destinationID) + ',' + str(self.sourceID) + ';'
		return myStr

	def SetVertexFromString(self, inputStr) :
		splitString = inputStr.split(',')
		self.inputID = int(splitString[0])
		self.outputID = int(splitString[1])

		self.destinationIP = HeepIPAddress(0,0,0,0)
		self.destinationIP.SetIPFromString(splitString[2])

		self.destinationID = int(splitString[3])
		self.sourceID = int(splitString[4])

	def PrepareForJSON(self) :
		self.inputID = self.inputID
		self.outputID = self.outputID
		self.destinationIP = self.destinationIP
		self.destinationID = self.destinationID
		self.sourceID = self.sourceID

	def FromDict(self, Dict) :
		self.__dict__ = Dict
