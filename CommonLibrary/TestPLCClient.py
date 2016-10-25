from PLCClient import PLCClient
from ControlValue import ControlValue

otherClient = PLCClient()
otherClient.ClientName = 'Sloppy'
Control1 = ControlValue()
Control1.ControlName = 'Forge'
Control2 = ControlValue()
Control2.ControlName = 'Fast'
Control2.ControlValueType = Control2.OnOff
otherClient.ControlList.append(Control1)
otherClient.ControlList.append(Control2)

print otherClient
firstCtrl = otherClient.ControlList[1]
firstCtrl.CurCtrlValue = 40
otherClient.QueueControl(firstCtrl)

curCtrl = otherClient.ControlList[0]
curCtrl.CurCtrlValue = 3
otherClient.QueueControl(curCtrl)
curCtrl.CurCtrlValue = 5
otherClient.QueueControl(curCtrl)
otherClient.QueueControlByName('Forge', 210)

print otherClient.GetQueuedControlString()
print otherClient.GetQueuedControlString()

otherClient.UpdateControlsByString('Fast,20;Forge,30;')

print otherClient.ControlList[0].CurCtrlValue
print otherClient.ControlList[1].CurCtrlValue