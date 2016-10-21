from PLCClient import PLCClient
from ControlValue import ControlValue
import json

tt = PLCClient()
tt.ClientName = 'Floppy'
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

clientList = []
clientList.append(tt)
clientList.append(otherClient)


newClient = json.loads(tt.toJSON())
newOtherClient = json.loads(otherClient.toJSON())
#newClient = client.toJSON()
#newOtherClient = otherClient.toJSON()
clientDictList = []
clientDictList.append(newClient)
clientDictList.append(newOtherClient)
#print clientDictList
with open('Test.json', 'w') as f:
	json.dump(clientDictList, f, sort_keys=True, indent=4, separators=(',', ': '))
f.close()



try :
	with open ('Test.json', 'r') as inFile:
		allExistingClients = json.load(inFile)
except :
	print 'No client JSON file found'

print len(allExistingClients)

aaaClient = PLCClient()
aaaClient.fromDict(allExistingClients[0])
bbbClient = PLCClient()
bbbClient.fromDict(allExistingClients[1])

print 'These should be the same'
print aaaClient.ControlList[0].ControlName
print tt.ControlList[0].ControlName


