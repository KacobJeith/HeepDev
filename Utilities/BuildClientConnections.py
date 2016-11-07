import json
import sys
sys.path.insert(0, '../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from Vertex import Vertex

def ReadClientListJSON(filePath) :
		clientList = []

		try :
			with open (filePath, 'r') as inFile:
				allExistingClients = json.load(inFile)

			for x in range(0, len(allExistingClients)) :
				newClient = PLCClient()
				newClient.fromDict(allExistingClients[x])
				clientList.append(newClient)
		except :
			print 'No client file found'

		return clientList

def PrintAllClientControls(controlList) :

	for x in range(0, len(controlList)) :
		curControl = controlList[x]
		print '		ControlName: ' + curControl.ControlName
		print '			ControlDirection: ' + str(curControl.ControlDirection)
		print '			ControlType: ' + str(curControl.ControlValueType)
		print '			HighValue: ' + str(curControl.HighValue)
		print '			LowValue: '	+ str(curControl.LowValue)

	return

def printAllClientVertices(vertexList) :
	for x in range(0, len(vertexList)) :
		curVertex = vertexList[x]
		print '		Vertex #' + str(x+1)
		print '			InputName: ' + curVertex.inputName
		print '			OutputName: ' + curVertex.outputName
		print '			DestinationID: ' + str(curVertex.destinationID)
		print '			SourceID: ' + str(curVertex.sourceID)
		print '			DestinationIP: ' + curVertex.destinationIP
		
	return

def PrintAllClientInfo(clientList) :
	print ''
	print 'CLIENT LIST:'
	for x in range(0, len(clientList)) :
		curClient = clientList[x]
		print 'Client Name: ' + curClient.ClientName
		print '	Client ID: ' + str(curClient.ClientID)
		print '	Client Type: ' + str(curClient.ClientType)
		print '	Client IP: ' + curClient.IPAddress
		print '	Controls: '
		PrintAllClientControls(curClient.ControlList)
		print '	Vertices: '
		printAllClientVertices(curClient.VertexList)
		print ''

	print ''


fileLocation = '../Server/clientList.json'

clientList = ReadClientListJSON(fileLocation)

PrintAllClientInfo(clientList)