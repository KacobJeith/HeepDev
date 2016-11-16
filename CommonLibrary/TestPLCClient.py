from PLCClient import PLCClient
from ControlValue import ControlValue
from OutputData import OutputData
from Vertex import Vertex

def CheckEquality(first, second, testName) :
	if first == second :
		return testName + ': Success'
	return testName + ': Failed******'

# Create Controls and PLC Client
otherClient = PLCClient()
otherClient.ClientName = 'Sloppy'
Control1 = ControlValue()
Control1.ControlName = 'Forge'
Control2 = ControlValue()
Control2.ControlName = 'Fast'
otherClient.ControlList.append(Control1)
otherClient.ControlList.append(Control2)
print CheckEquality(otherClient.ClientName, 'Sloppy', 'ClientNameSetTest')

# Extract, Create, and Update Queued Commands
firstCtrl = otherClient.ControlList[1]
firstCtrl.CurCtrlValue = 40
otherClient.QueueControl(firstCtrl)
curCtrl = otherClient.ControlList[0]
curCtrl.CurCtrlValue = 3
otherClient.QueueControl(curCtrl)
curCtrl.CurCtrlValue = 5
otherClient.QueueControl(curCtrl)
otherClient.QueueControlByName('Forge', 210)
print CheckEquality(otherClient.GetQueuedControlString(), 'Fast,40;Forge,210;', 'QueueControlByNameTest')
print CheckEquality(otherClient.GetQueuedControlString(), '', 'GetQueuedControlStringTest')

# Update controls on a client by string
otherClient.UpdateControlsByString('Fast,20;Forge,30;')
print CheckEquality(otherClient.ControlList[0].CurCtrlValue, 30, 'UpdateControlsByStringTest1')
print CheckEquality(otherClient.ControlList[1].CurCtrlValue, 20, 'UpdateControlsByStringTest2')

# Transfer client information via serialization
controlStr = otherClient.GetClientString()
newClient = PLCClient()
newClient.SetClientFromString(controlStr)

print CheckEquality(otherClient.ClientID, newClient.ClientID, 'Transfer client information')

newClient = PLCClient()
myVertex = Vertex()
myVertex.inputName = 'Chad'
myVertex.outputName = 'Steve'
myVertex.destinationID = 123456
myVertex.sourceID = 666
myVertex.destinationIP = 'myIP'
newClient.AddVertex(myVertex)

outputQueue = newClient.QueueOutput('Steve', 20)

print CheckEquality( len(outputQueue), 1, 'Output Queue Size')

myVertex = Vertex()
myVertex.inputName = 'Rick'
myVertex.outputName = 'Steve'
myVertex.destinationID = 123223456
myVertex.sourceID = 666
myVertex.destinationIP = 'myIP'
newClient.AddVertex(myVertex)

outputQueue = newClient.QueueOutput('Steve', 20)

print CheckEquality( len(outputQueue), 2, 'Output Queue Size Two Items')
print CheckEquality( outputQueue[0].inputName, 'Chad', 'Output Queue input name 1')
print CheckEquality( outputQueue[1].inputName, 'Rick', 'Output Queue input name 2')
print CheckEquality( newClient.GetVerticesString(), 'Chad,Steve,myIP,123456,666;Rick,Steve,myIP,123223456,666;', 'Get Vertex String')

VertexStr = newClient.GetVerticesString()
vertClient = PLCClient()
vertClient.SetVerticesFromString(newClient.GetVerticesString())
print CheckEquality( newClient.GetVerticesString(), vertClient.GetVerticesString(), 'Vertex client setup')

# Vertex Deletion
print newClient.GetVerticesString()
newClient.RemoveVertexByName(123223456, 'Steve', 'Rick')
print newClient.GetVerticesString()
print CheckEquality( newClient.GetVerticesString(), 'Chad,Steve,myIP,123456,666;', 'Remove Second Vertex')







