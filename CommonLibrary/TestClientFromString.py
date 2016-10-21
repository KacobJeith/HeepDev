from PLCClient import PLCClient
from ControlValue import ControlValue
import json

otherClient = PLCClient()
otherClient.ClientName = 'Sloppy'
Control1 = ControlValue()
Control1.ControlName = 'Forge'
Control2 = ControlValue()
Control2.ControlName = 'Fast'
Control2.ControlValueType = Control2.OnOff

otherClient.ControlList.append(Control1)
otherClient.ControlList.append(Control2)

test = otherClient.toJSON()
newClient = json.loads(test)

newClient = json.loads(otherClient.toJSON())
with open('Test.json', 'w') as f:
	json.dump(newClient, f, sort_keys=True, indent=4, separators=(',', ': '))
f.close()

try :
	with open ('Test.json', 'r') as inFile:
		allExistingClients = json.load(inFile)
except :
	print 'No client JSON file found'

aaaClient = PLCClient()
aaaClient.fromDict(allExistingClients)

print 'These should be the same'
print aaaClient.ControlList[1].ControlName
print otherClient.ControlList[1].ControlName