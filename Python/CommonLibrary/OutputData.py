from CommonDataTypes import HeepIPAddress

class OutputData:

	inputID = 0
	destinationID = 0
	destinationIP = HeepIPAddress(0,0,0,0)
	sourceID = 0
	value = 0

	def __init__(self, _inputID, _destID, _destIP, _sourceID, _value):
		self.inputID = _inputID
		self.destinationID = _destID
		self.destinationIP = _destIP
		self.sourceID = _sourceID
		self.value = _value
		return