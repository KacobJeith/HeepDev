from Device import Device
from ControlValue import ControlValue
from OutputData import OutputData
from Vertex import Vertex
from DeviceMemory import DeviceMemory
from MemoryUtilities import MemoryUtilities
from CommonDataTypes import HeepIPAddress
from ActionOpCodeParser import ActionOpCodeParser
from OpCodeUtilities import OpCodeUtilities

def CheckEquality(first, second, testName) :
	if first == second :
		return testName + ': Success'
	return testName + ': Failed******   Received: ' + str(first) + ' ****  Expected:' + str(second)

# Create Controls and Devices
otherDevice = Device()
otherDevice.DeviceID = 1523
otherDevice.DeviceName = 'Sloppy'
Control1 = ControlValue()
Control1.ControlName = 'Forge'
Control2 = ControlValue()
Control2.ControlName = 'Fast'
otherDevice.ControlList.append(Control1)
otherDevice.ControlList.append(Control2)
print CheckEquality(otherDevice.DeviceName, 'Sloppy', 'DeviceNameSetTest')

# Extract, Create, and Update Queued Commands
firstCtrl = otherDevice.ControlList[1]
firstCtrl.CurCtrlValue = 40
otherDevice.QueueControl(firstCtrl)
curCtrl = otherDevice.ControlList[0]
curCtrl.CurCtrlValue = 3
otherDevice.QueueControl(curCtrl)
curCtrl.CurCtrlValue = 5
otherDevice.QueueControl(curCtrl)
otherDevice.QueueControlByName('Forge', 210)
print CheckEquality(otherDevice.GetQueuedControlString(), 'Fast,40;Forge,210;', 'QueueControlByNameTest')
print CheckEquality(otherDevice.GetQueuedControlString(), '', 'GetQueuedControlStringTest')

# Update controls on a device by string
otherDevice.UpdateControlsByString('Fast,20;Forge,30;')
print CheckEquality(otherDevice.ControlList[0].CurCtrlValue, 30, 'UpdateControlsByStringTest1')
print CheckEquality(otherDevice.ControlList[1].CurCtrlValue, 20, 'UpdateControlsByStringTest2')

# Transfer device information via serialization
controlStr = otherDevice.GetDeviceString()
newDevice = Device()
newDevice.DeviceID = 1523
newDevice.SetDeviceFromString(controlStr)

print CheckEquality(len(newDevice.ControlList), len(otherDevice.ControlList), 'Transfer device information')

newDevice = Device()
myVertex = Vertex()
myVertex.inputID = 1
myVertex.outputID = 2
myVertex.destinationID = 123456
myVertex.sourceID = 666
myVertex.destinationIP = HeepIPAddress(192, 142, 132, 132)
newDevice.AddVertex(myVertex)

outputQueue = newDevice.QueueOutput(2, 20)

print CheckEquality( len(outputQueue), 1, 'Output Queue Size')

myVertex = Vertex()
myVertex.inputID = 2
myVertex.outputID = 2
myVertex.destinationID = 123223456
myVertex.sourceID = 666
myVertex.destinationIP = HeepIPAddress(192, 142, 132, 132)
newDevice.AddVertex(myVertex)

outputQueue = newDevice.QueueOutput(2, 20)

print CheckEquality( len(outputQueue), 2, 'Output Queue Size Two Items')
print CheckEquality( outputQueue[0].inputID, 1, 'Output Queue input name 1')
print CheckEquality( outputQueue[1].inputID, 2, 'Output Queue input name 2')
print CheckEquality( newDevice.GetVerticesString(), '1,2,192.142.132.132,123456,666;2,2,192.142.132.132,123223456,666;', 'Get Vertex String')

VertexStr = newDevice.GetVerticesString()
vertDevice = Device()
vertDevice.SetVerticesFromString(newDevice.GetVerticesString())
print CheckEquality( newDevice.GetVerticesString(), vertDevice.GetVerticesString(), 'Vertex device setup')

# Vertex Deletion
deletionDevice = newDevice
myVertex = Vertex()
myVertex.inputID = 1
myVertex.outputID = 2
myVertex.destinationID = 98587649
myVertex.sourceID = 987123
myVertex.destinationIP = HeepIPAddress(10, 10, 10, 10)
deletionDevice.AddVertex(myVertex)

deletionDevice.RemoveVertex(123223456, 2, 2)
print CheckEquality( deletionDevice.GetVerticesString(), '1,2,192.142.132.132,123456,666;1,2,10.10.10.10,98587649,987123;', 'Remove Middle Vertex')
deletionDevice.RemoveVertex(123456, 2, 1)
print CheckEquality( deletionDevice.GetVerticesString(), '1,2,10.10.10.10,98587649,987123;', 'Remove First Vertex')
deletionDevice.RemoveVertex(98587649, 2, 1)
print CheckEquality( deletionDevice.GetVerticesString(), '', 'Remove Only Vertex')

# Memory Funcionality
DeviceMemory = DeviceMemory()
MemoryUtilities = MemoryUtilities()
byteArray = []
print CheckEquality( OpCodeUtilities().GetNecessaryBytes(255), 1, 'Device Memory Get Bytes 1')
print CheckEquality( OpCodeUtilities().GetNecessaryBytes(256), 2, 'Device Memory Get Bytes 2')
print CheckEquality( OpCodeUtilities().GetNecessaryBytes(65535), 2, 'Device Memory Get Bytes 3')
print CheckEquality( OpCodeUtilities().GetNecessaryBytes(65536), 3, 'Device Memory Get Bytes 4')
print CheckEquality( OpCodeUtilities().GetNecessaryBytes(4), 1, 'Device Memory Get Bytes 5')

print CheckEquality( OpCodeUtilities().GetByteArrayFromValue(256), [chr(0x01), chr(0x00)], 'Device Memory Get Byte Array From Value 1')
print CheckEquality( OpCodeUtilities().GetByteArrayFromValue(255), [chr(0xff)], 'Device Memory Get Byte Array From Value 2')
print CheckEquality( OpCodeUtilities().GetByteArrayFromValue(65536), [chr(0x01), chr(0x00), chr(0x00)], 'Device Memory Get Byte Array From Value 3')

print CheckEquality( MemoryUtilities.GetConstantSizeByteArrayFromValue(1, 2), [chr(0x00), chr(0x01)], 'Get Constant Size Byte Array from Value 1') 
print CheckEquality( MemoryUtilities.GetConstantSizeByteArrayFromValue(300, 2), [chr(0x01), chr(0x2C)], 'Get Constant Size Byte Array from Value 2') 

DeviceMemory.SetDeviceName('Fox', 1613)
DeviceMemory.SetDeviceName('Fortune', 12422)
DeviceMemory.SetDeviceXY(1234, 5678, 6666)
print CheckEquality( DeviceMemory.GetDeviceXY(6666), (1234, 5678), 'Get Device XY From Memory 1')
print CheckEquality( DeviceMemory.GetDeviceXY(1252), (-1, -1), 'Get Device XY Failure From Memory 2')
print CheckEquality( DeviceMemory.GetDeviceName(6666), 'None', 'Get Device Name From Memory 1')
print CheckEquality( DeviceMemory.GetDeviceName(1613), 'Fox', 'Get Device Name From Memory 2')
print CheckEquality( DeviceMemory.GetDeviceName(12422), 'Fortune', 'Get Device Name From Memory 3')

DeviceMemory.SetDeviceXY(9182, 50230, 6666)
DeviceMemory.SetDeviceName('Fencing', 1324)
print CheckEquality( DeviceMemory.GetDeviceXY(6666), (9182, 50230), 'Update Device XY From Memory 1')
print CheckEquality( DeviceMemory.GetDeviceName(1324), 'Fencing', 'Get Device Name From Memory 3')

MemoryUtilities.AppendDeviceDataToByteArray(byteArray, 2038912)
print CheckEquality( MemoryUtilities.GetDeviceFirmware(byteArray, 2038912), 1, 'Get Device Firmware Version')

byteArray = MemoryUtilities.AppendControlDataToByteArray(byteArray, 2038912, Control1)
print CheckEquality( MemoryUtilities.GetDeviceControlValue(byteArray, 2038912)[0].ControlID, Control1.ControlID, 'Get Device Control Value 1')
byteArray = MemoryUtilities.AppendControlDataToByteArray(byteArray, 2038912, Control2)
print CheckEquality( len(MemoryUtilities.GetDeviceControlValue(byteArray, 2038912)), 2, 'Get Device Control Value 2')
print CheckEquality( len(MemoryUtilities.GetDeviceControlValue(byteArray, 322)), 0, 'Get Device Control Value 3')

byteArray = MemoryUtilities.AppendVertexDataToByteArray(byteArray, myVertex)
print CheckEquality(MemoryUtilities.GetVertexFromByteArray(byteArray, 987123).destinationID, 98587649, 'Get Vertex Opcode')

byteArray = []
myIP = HeepIPAddress(192, 168, 1, 1)
byteArray = MemoryUtilities.AppendIPAddressToByteArray(byteArray, 1236123, myIP)
print CheckEquality(MemoryUtilities.GetIPAddressFromByteArray(byteArray, 1236123).GetIPAsString(), "192.168.1.1", "Get IP From Memory")

byteArray = MemoryUtilities.AppendIconIDToByteArray(byteArray, 512413, 131)
print CheckEquality(MemoryUtilities.GetIconIDFromByteArray(byteArray, 512413), 131, "Get Icon ID From Byte Array")

fakeIconData = []
for x in range(0,132) :
	fakeIconData.append(chr(x))
byteArray = MemoryUtilities.AppendIconDataToByteArray(byteArray, 15132, fakeIconData)
print CheckEquality(MemoryUtilities.GetIconDataFromByteArray(byteArray, 15132), fakeIconData, "Get Icon Data from Byte array")

for x in range(0, 100) :
	byteArray = MemoryUtilities.AppendControlDataToByteArray(byteArray, x*5, Control1)
byteArray = MemoryUtilities.AppendVertexDataToByteArray(byteArray, myVertex)
print CheckEquality(MemoryUtilities.GetVertexFromByteArray(byteArray, 987123).destinationID, 98587649, 'Get Vertex Opcode after Much Data Added')

# OpCode Device Integration
otherDevice = Device()
otherDevice.DeviceID = 12332
otherDevice.DeviceName = 'Sloppy'
Control1 = ControlValue()
Control1.ControlName = 'Forge'
Control1.ControlID = 0
Control2 = ControlValue()
Control2.ControlName = 'Fast'
Control2.ControlID = 1
otherDevice.ControlList.append(Control1)
otherDevice.ControlList.append(Control2)
otherDevice.AddVertex(myVertex)
otherDevice.SetFrontEndXY(10322, 1032)
otherDevice.SetIPAddress(myIP)

otherDevice.SetIconInformation(1, [chr(3), chr(4), chr(12), chr(41)]) 
myString = otherDevice.GetDeviceString()

print CheckEquality(OpCodeUtilities().ConvertStringToByteArray(myString), otherDevice.GetDeviceByteArray(), "Get Device String OpCodes")
print CheckEquality(otherDevice.GetIPAddress().GetIPAsString(), "192.168.1.1", "Get Device IP Address")


# Action Op Codes
actionParser = ActionOpCodeParser()
myArray = [chr(0x0A), chr(0x02), chr(0x01), chr(0x0f)]
SuccessArray = [chr(0x10), chr(0x00), chr(0x00), chr(0x30), chr(0x2c), chr(len("Value Set"))]
SuccessArray = OpCodeUtilities().AppendStringToByteArray(SuccessArray, "Value Set")
SuccessString = OpCodeUtilities().GetStringFromByteArray(SuccessArray)
print CheckEquality(actionParser.GetActionOpCodeFromByteArray(myArray, otherDevice),SuccessString, 'Action Op Code Accepted By Parser')

myArray = [chr(0x0A), chr(0x02), chr(0x02), chr(0x0f)]
ErrorArray = [chr(0x11), chr(0x00), chr(0x00), chr(0x30), chr(0x2c), chr(len("Control Not Found"))]
ErrorArray = OpCodeUtilities().AppendStringToByteArray(ErrorArray, "Control Not Found")
ErrorString = OpCodeUtilities().GetStringFromByteArray(ErrorArray)
print CheckEquality(actionParser.GetActionOpCodeFromByteArray(myArray, otherDevice), ErrorString, 'Action Op Code Control Not Found')

myArray = [chr(0x51), chr(0x02), chr(0x02), chr(0x0f)]
ErrorArray = [chr(0x11), chr(0x00), chr(0x00), chr(0x30), chr(0x2c), chr(len("HAPI COP Not Found"))]
ErrorArray = OpCodeUtilities().AppendStringToByteArray(ErrorArray, "HAPI COP Not Found")
ErrorString = OpCodeUtilities().GetStringFromByteArray(ErrorArray)
print CheckEquality(actionParser.GetActionOpCodeFromByteArray(myArray, otherDevice), ErrorString, 'Action Op Code Not Found')

myArray = [chr(0x09), chr(0x00)]
begginingROPString = OpCodeUtilities().GetStringFromByteArray([chr(0x0F), chr(0x00), chr(0x00), chr(0x30), chr(0x2c), chr(len(otherDevice.GetDeviceString()))])
print CheckEquality(actionParser.GetActionOpCodeFromByteArray(myArray, otherDevice), begginingROPString+otherDevice.GetDeviceString(), 'Action Op Code: Is Heep Device')

myArray = [chr(0x0B), chr(0x04), chr(0x01), chr(0x01), chr(0x02), chr(0x10)]
SuccessArray = [chr(0x10), chr(0x00), chr(0x00), chr(0x30), chr(0x2c), chr(len("XY Position Set to (257,528)"))]
SuccessArray = OpCodeUtilities().AppendStringToByteArray(SuccessArray, "XY Position Set to (257,528)")
SuccessString = OpCodeUtilities().GetStringFromByteArray(SuccessArray)
print CheckEquality(actionParser.GetActionOpCodeFromByteArray(myArray, otherDevice),SuccessString, 'Action Op Code: Set XY 1')
print CheckEquality(otherDevice.GetFrontEndXY(), (257,528), 'Action Op Code: Set XY 2')

myArray = [chr(0x0C), chr(0x04), chr(0x01), chr(0x01), chr(0x02), chr(0x10), chr(0x02), chr(0x05), chr(0x50), chr(0x02), chr(0x02), chr(0x01), chr(192), chr(168), chr(0x01), chr(0x01)]
actionParser.GetActionOpCodeFromByteArray(myArray, otherDevice)
print CheckEquality(otherDevice.VertexList[1].destinationIP.GetIPAsString(), '192.168.1.1', 'Set Vertex COP 1')
print CheckEquality(otherDevice.VertexList[1].outputID, 2, 'Set Vertex COP 2')
print CheckEquality(otherDevice.VertexList[1].inputID, 1, 'Set Vertex COP 3')
print CheckEquality(otherDevice.VertexList[1].sourceID, 16843280, 'Set Vertex COP 4')
print CheckEquality(otherDevice.VertexList[1].destinationID, 33902594, 'Set Vertex COP 5')

print CheckEquality(len(otherDevice.VertexList), 2, 'Vertex List Length Before Deletion')
myArray = [chr(0x0D), chr(0x04), chr(0x01), chr(0x01), chr(0x02), chr(0x10), chr(0x02), chr(0x05), chr(0x50), chr(0x02), chr(0x02), chr(0x01), chr(192), chr(168), chr(0x01), chr(0x01)]
actionParser.GetActionOpCodeFromByteArray(myArray, otherDevice)
print CheckEquality(len(otherDevice.VertexList), 1, 'Vertex List Length After Deletion')


