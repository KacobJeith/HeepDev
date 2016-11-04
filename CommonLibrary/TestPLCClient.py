from PLCClient import PLCClient
from ControlValue import ControlValue

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
