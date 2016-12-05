from PLCClient import PLCClient
from ControlValue import ControlValue
from Vertex import Vertex
import json

def CheckEquality(first, second, testName) :
	if first == second :
		return testName + ': Success'
	return testName + ': Failed******'

# Generate Clients that will be turned into JSON
tt = PLCClient()
tt.ClientName = 'Floppy'
tt.IconName = 'light-bulb'
tt.ControlList.append(ControlValue())

otherClient = PLCClient()
otherClient.ClientName = 'Sloppy'
Control1 = ControlValue()
Control1.ControlName = 'Forge'
Control2 = ControlValue()
Control2.ControlName = 'Fast'
Control2.ControlValueType = Control2.OnOff
otherClient.ControlList.append(Control1)
otherClient.ControlList.append(Control2)
myVertex = Vertex()
myVertex.inputName = 'Rick'
myVertex.outputName = 'Steve'
myVertex.destinationID = 123223456
myVertex.sourceID = 666
myVertex.destinationIP = 'myIP'
otherClient.AddVertex(myVertex)
myVertex = Vertex()
myVertex.inputName = 'Lick'
myVertex.outputName = 'Lock'
myVertex.destinationID = 123223456
myVertex.sourceID = 666
myVertex.destinationIP = 'myIP'
otherClient.AddVertex(myVertex)

clientList = []
clientList.append(tt)
clientList.append(otherClient)

# Generate a JSON File
newClient = tt.toJSONDict()
newOtherClient = otherClient.toJSONDict()
clientDictList = []
clientDictList.append(newClient)
clientDictList.append(newOtherClient)
with open('Test.json', 'w') as f:
	json.dump(clientDictList, f, sort_keys=True, indent=4, separators=(',', ': '))
f.close()


# Load New PLC Clients from a JSON file
try :
	with open ('Test.json', 'r') as inFile:
		allExistingClients = json.load(inFile)
except :
	print 'No client JSON file found'

aaaClient = PLCClient()
aaaClient.fromDict(allExistingClients[0])
bbbClient = PLCClient()
bbbClient.fromDict(allExistingClients[1])


print CheckEquality(aaaClient.IconName, tt.IconName, 'SettingIconTest')
print CheckEquality(aaaClient.ControlList[0].ControlName, tt.ControlList[0].ControlName, 'FromJSONControlTest')
print CheckEquality(bbbClient.VertexList[0].outputName, bbbClient.VertexList[0].outputName, 'FromJSONVertexTest')
print CheckEquality(bbbClient.VertexList[1].outputName, bbbClient.VertexList[1].outputName, 'FromJSONVertexTest')
