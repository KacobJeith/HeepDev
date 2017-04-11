from PLCClient import PLCClient
from ControlValue import ControlValue
from OutputData import OutputData
from Vertex import Vertex
from ClientMemory import ClientMemory
from HeepMemoryUtilities import HeepMemoryUtilities

def CheckEquality(first, second, testName) :
	if first == second :
		return testName + ': Success'
	return testName + ': Failed******   Received: ' + str(first) + ' ****  Expected:' + str(second)

# Create Controls and PLC Client
otherClient = PLCClient()
otherClient.ClientID = 1523
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
newClient.ClientID = 1523
newClient.SetClientFromString(controlStr)

print CheckEquality(len(newClient.ControlList), len(otherClient.ControlList), 'Transfer client information')

newClient = PLCClient()
myVertex = Vertex()
myVertex.inputID = 1
myVertex.outputID = 2
myVertex.destinationID = 123456
myVertex.sourceID = 666
myVertex.destinationIP = '192.142.132.132'
myVertex.vertexID = 0
newClient.AddVertex(myVertex)

outputQueue = newClient.QueueOutput(2, 20)

print CheckEquality( len(outputQueue), 1, 'Output Queue Size')

myVertex = Vertex()
myVertex.inputID = 2
myVertex.outputID = 2
myVertex.destinationID = 123223456
myVertex.sourceID = 666
myVertex.destinationIP = '192.142.132.132'
myVertex.vertexID = 1
newClient.AddVertex(myVertex)

outputQueue = newClient.QueueOutput(2, 20)

print CheckEquality( len(outputQueue), 2, 'Output Queue Size Two Items')
print CheckEquality( outputQueue[0].inputID, 1, 'Output Queue input name 1')
print CheckEquality( outputQueue[1].inputID, 2, 'Output Queue input name 2')
print CheckEquality( newClient.GetVerticesString(), '1,2,192.142.132.132,123456,666,0;2,2,192.142.132.132,123223456,666,1;', 'Get Vertex String')

VertexStr = newClient.GetVerticesString()
vertClient = PLCClient()
vertClient.SetVerticesFromString(newClient.GetVerticesString())
print CheckEquality( newClient.GetVerticesString(), vertClient.GetVerticesString(), 'Vertex client setup')

# Vertex Deletion
deletionClient = newClient
myVertex = Vertex()
myVertex.inputID = 1
myVertex.outputID = 2
myVertex.destinationID = 98587649
myVertex.sourceID = 987123
myVertex.destinationIP = '10.10.10.10'
myVertex.vertexID = 2
deletionClient.AddVertex(myVertex)

deletionClient.RemoveVertex(123223456, 2, 2)
print CheckEquality( deletionClient.GetVerticesString(), '1,2,192.142.132.132,123456,666,0;1,2,10.10.10.10,98587649,987123,2;', 'Remove Middle Vertex')
deletionClient.RemoveVertex(123456, 2, 1)
print CheckEquality( deletionClient.GetVerticesString(), '1,2,10.10.10.10,98587649,987123,2;', 'Remove First Vertex')
deletionClient.RemoveVertex(98587649, 2, 1)
print CheckEquality( deletionClient.GetVerticesString(), '', 'Remove Only Vertex')

# Memory Funcionality
ClientMemory = ClientMemory()
HeepMemoryUtilities = HeepMemoryUtilities()
byteArray = []
print CheckEquality( HeepMemoryUtilities.GetNecessaryBytes(255), 1, 'Client Memory Get Bytes 1')
print CheckEquality( HeepMemoryUtilities.GetNecessaryBytes(256), 2, 'Client Memory Get Bytes 2')
print CheckEquality( HeepMemoryUtilities.GetNecessaryBytes(65535), 2, 'Client Memory Get Bytes 3')
print CheckEquality( HeepMemoryUtilities.GetNecessaryBytes(65536), 3, 'Client Memory Get Bytes 4')
print CheckEquality( HeepMemoryUtilities.GetNecessaryBytes(4), 1, 'Client Memory Get Bytes 5')

print CheckEquality( HeepMemoryUtilities.GetByteArrayFromValue(256), [chr(0x01), chr(0x00)], 'Client Memory Get Byte Array From Value 1')
print CheckEquality( HeepMemoryUtilities.GetByteArrayFromValue(255), [chr(0xff)], 'Client Memory Get Byte Array From Value 2')
print CheckEquality( HeepMemoryUtilities.GetByteArrayFromValue(65536), [chr(0x01), chr(0x00), chr(0x00)], 'Client Memory Get Byte Array From Value 3')

print CheckEquality( HeepMemoryUtilities.GetConstantSizeByteArrayFromValue(1, 2), [chr(0x00), chr(0x01)], 'Get Constant Size Byte Array from Value 1') 
print CheckEquality( HeepMemoryUtilities.GetConstantSizeByteArrayFromValue(300, 2), [chr(0x01), chr(0x2C)], 'Get Constant Size Byte Array from Value 2') 

ClientMemory.SetClientName('Fox', 1613)
ClientMemory.SetClientName('Fortune', 12422)
ClientMemory.SetClientXY(1234, 5678, 6666)
print CheckEquality( ClientMemory.GetClientXY(6666), (1234, 5678), 'Get Client XY From Memory 1')
print CheckEquality( ClientMemory.GetClientXY(1252), (-1, -1), 'Get Client XY Failure From Memory 2')
print CheckEquality( ClientMemory.GetClientName(6666), 'None', 'Get Client Name From Memory 1')
print CheckEquality( ClientMemory.GetClientName(1613), 'Fox', 'Get Client Name From Memory 2')
print CheckEquality( ClientMemory.GetClientName(12422), 'Fortune', 'Get Client Name From Memory 3')

ClientMemory.SetClientXY(9182, 50230, 6666)
ClientMemory.SetClientName('Fencing', 1324)
print CheckEquality( ClientMemory.GetClientXY(6666), (9182, 50230), 'Update Client XY From Memory 1')
print CheckEquality( ClientMemory.GetClientName(1324), 'Fencing', 'Get Client Name From Memory 3')

HeepMemoryUtilities.AppendClientDataToByteArray(byteArray, 2038912)
print CheckEquality( HeepMemoryUtilities.GetClientFirmware(byteArray, 2038912), 1, 'Get Client Firmware Version')

byteArray = HeepMemoryUtilities.AppendControlDataToByteArray(byteArray, 2038912, Control1)
print CheckEquality( HeepMemoryUtilities.GetClientControlValue(byteArray, 2038912)[0].ControlID, Control1.ControlID, 'Get Client Control Value 1')
byteArray = HeepMemoryUtilities.AppendControlDataToByteArray(byteArray, 2038912, Control2)
print CheckEquality( len(HeepMemoryUtilities.GetClientControlValue(byteArray, 2038912)), 2, 'Get Client Control Value 2')
print CheckEquality( len(HeepMemoryUtilities.GetClientControlValue(byteArray, 322)), 0, 'Get Client Control Value 3')

byteArray = HeepMemoryUtilities.AppendVertexDataToByteArray(byteArray, myVertex)
print CheckEquality(HeepMemoryUtilities.GetVertexFromByteArray(byteArray, 987123).destinationID, 98587649, 'Get Vertex Opcode')

byteArray = []

byteArray = HeepMemoryUtilities.AppendIPAddressToByteArray(byteArray, 1236123, "192.168.1.1")
print CheckEquality(HeepMemoryUtilities.GetIPAddressFromByteArray(byteArray, 1236123), "192.168.1.1", "Get IP From Memory")

byteArray = HeepMemoryUtilities.AppendIconIDToByteArray(byteArray, 512413, 131)
print CheckEquality(HeepMemoryUtilities.GetIconIDFromByteArray(byteArray, 512413), 131, "Get Icon ID From Byte Array")

fakeIconData = []
for x in range(0,132) :
	fakeIconData.append(chr(x))
byteArray = HeepMemoryUtilities.AppendIconDataToByteArray(byteArray, 15132, fakeIconData)
print CheckEquality(HeepMemoryUtilities.GetIconDataFromByteArray(byteArray, 15132), fakeIconData, "Get Icon Data from Byte array")

for x in range(0, 100) :
	byteArray = HeepMemoryUtilities.AppendControlDataToByteArray(byteArray, x*5, Control1)
byteArray = HeepMemoryUtilities.AppendVertexDataToByteArray(byteArray, myVertex)
print CheckEquality(HeepMemoryUtilities.GetVertexFromByteArray(byteArray, 987123).destinationID, 98587649, 'Get Vertex Opcode after Much Data Added')

# OpCode Client Integration
otherClient = PLCClient()
otherClient.ClientID = 12332
otherClient.ClientName = 'Sloppy'
Control1 = ControlValue()
Control1.ControlName = 'Forge'
Control2 = ControlValue()
Control2.ControlName = 'Fast'
otherClient.ControlList.append(Control1)
otherClient.ControlList.append(Control2)
otherClient.AddVertex(myVertex)
otherClient.SetClientFrontEndXY(10322, 1032)
otherClient.SetIPAddress("192.168.1.1")

otherClient.SetIconInformation(1, [chr(3), chr(4), chr(12), chr(41)]) 
otherClient.SetServerless(1)
myString = otherClient.GetClientString()

print CheckEquality(HeepMemoryUtilities.ConvertStringToByteArray(myString), otherClient.GetClientByteArray(), "Get Client String OpCodes")
print CheckEquality(otherClient.GetIPAddress(), "192.168.1.1", "Get client IP Address")





