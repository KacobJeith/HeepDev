from PLCClient import PLCClient
from ControlValue import ControlValue
import json

def CheckEquality(first, second, testName) :
	if first == second :
		return testName + ': Success'
	return testName + ': Failed******'

# Generate Clients that will be turned into JSON
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

print CheckEquality(aaaClient.ControlList[0].ControlName, tt.ControlList[0].ControlName, 'FromJSONTest')
