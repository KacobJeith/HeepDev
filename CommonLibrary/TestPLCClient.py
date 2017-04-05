from PLCClient import PLCClient
from ControlValue import ControlValue
from OutputData import OutputData
from Vertex import Vertex
from ClientMemory import ClientMemory

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
deletionClient = newClient
myVertex = Vertex()
myVertex.inputName = 'canti'
myVertex.outputName = 'lever'
myVertex.destinationID = 98587649
myVertex.sourceID = 987123
myVertex.destinationIP = '10.10.10.10'
deletionClient.AddVertex(myVertex)

deletionClient.RemoveVertex(123223456, 'Steve', 'Rick')
print CheckEquality( deletionClient.GetVerticesString(), 'Chad,Steve,myIP,123456,666;canti,lever,10.10.10.10,98587649,987123;', 'Remove Middle Vertex')
deletionClient.RemoveVertex(123456, 'Steve', 'Chad')
print CheckEquality( deletionClient.GetVerticesString(), 'canti,lever,10.10.10.10,98587649,987123;', 'Remove First Vertex')
deletionClient.RemoveVertex(98587649, 'lever', 'canti')
print CheckEquality( deletionClient.GetVerticesString(), '', 'Remove Only Vertex')

# Memory Funcionality
ClientMemory = ClientMemory()
print CheckEquality( ClientMemory.GetNecessaryBytes(255), 1, 'Client Memory Get Bytes 1')
print CheckEquality( ClientMemory.GetNecessaryBytes(256), 2, 'Client Memory Get Bytes 2')
print CheckEquality( ClientMemory.GetNecessaryBytes(65535), 2, 'Client Memory Get Bytes 3')
print CheckEquality( ClientMemory.GetNecessaryBytes(65536), 3, 'Client Memory Get Bytes 4')
print CheckEquality( ClientMemory.GetNecessaryBytes(4), 1, 'Client Memory Get Bytes 5')

print CheckEquality( ClientMemory.GetByteArrayFromValue(256), [chr(0x01), chr(0x00)], 'Client Memory Get Byte Array From Value 1')
print CheckEquality( ClientMemory.GetByteArrayFromValue(255), [chr(0xff)], 'Client Memory Get Byte Array From Value 2')
print CheckEquality( ClientMemory.GetByteArrayFromValue(65536), [chr(0x01), chr(0x00), chr(0x00)], 'Client Memory Get Byte Array From Value 3')

print CheckEquality( ClientMemory.GetConstantSizeByteArrayFromValue(1, 2), [chr(0x00), chr(0x01)], 'Get Constant Size Byte Array from Value 1') 
print CheckEquality( ClientMemory.GetConstantSizeByteArrayFromValue(300, 2), [chr(0x01), chr(0x2C)], 'Get Constant Size Byte Array from Value 2') 

ClientMemory.SetClientName('Fox', 1613)
ClientMemory.SetClientName('Fortune', 12422)
ClientMemory.SetClientXY(1234, 5678, 6666)
ClientMemory.GetMemoryString()
print ClientMemory.GetClientXY(6666)
print ClientMemory.GetClientName(6666)
ClientMemory.SetClientXY(5132, 614, 6666)
ClientMemory.GetMemoryString()
print ClientMemory.GetClientXY(6666)
