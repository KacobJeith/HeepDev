from ClientConnection import ClientConnection
import sys
import time
sys.path.insert(0, '../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from Vertex import Vertex

client = ClientConnection()

functionalClient = PLCClient()
functionalClient.ClientID = 666
functionalClient.ClientName = 'This is not a Test'
functionalClient.ControlList.append(ControlValue())
OnOffControls = ControlValue()
OnOffControls.ControlName = 'gear' 
functionalClient.ControlList.append(OnOffControls)

myVertex = Vertex()
myVertex.inputName = 'Rick'
myVertex.outputName = 'Steve'
myVertex.destinationID = 123223456
myVertex.sourceID = 666
myVertex.destinationIP = 'myIP'
functionalClient.AddVertex(myVertex)

myVertex = Vertex()
myVertex.inputName = 'Lock'
myVertex.outputName = 'Storm'
myVertex.destinationID = 2332
myVertex.sourceID = 666
myVertex.destinationIP = 'myIP'
functionalClient.AddVertex(myVertex)

client.SetClientData(functionalClient)

client.Connect()
print client.SendClientDataToServer()
print client.SendClientVertexDataToServer()
print client.GetClientList()
print client.UpdateClientControl('10.0.0.196', 'LEDState', 1)
print client.GetQueuedCommandsFromServer()
print client.GetQueuedCommandsFromServer()
print client.GetVerticesFromServer()

for x in range (0, 20) :
	print client.EchoDataFromServer(str(x))

	