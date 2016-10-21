from PLCClient import PLCClient
from ControlValue import ControlValue
import json

client = PLCClient()
client.SetClientFromString('192.168.1.1,2,Kadelope,0,Mexico,0,Torid,1,Jao,0,100')

print client.IPAddress
print client.ControlList

for x in range(0, len(client.ControlList)) :
	print client.ControlList[x].ControlName

print client.GetClientString()

otherClient = PLCClient()
otherClient.ClientName = 'Sloppy'
Control1 = ControlValue()
Control1.ControlName = 'Forge'
Control2 = ControlValue()
Control2.ControlName = 'Fast'

otherClient.ControlList.append(Control1)
otherClient.ControlList.append(Control2)
test = otherClient.toJSON()
print test

newClient = json.loads(test)
print newClient

anotherClient = PLCClient()
anotherClient.fromJSON(test)
print anotherClient.ClientName
print anotherClient.ControlList[1].ControlName


newClient = json.loads(client.toJSON())
with open('Test.json', 'w') as f:
	json.dump(newClient, f, sort_keys=True, indent=4, separators=(',', ': '))
print newClient
f.close()

try :
	with open ('Test.json', 'r') as inFile:
		allExistingClients = json.load(inFile)
	
except :
	print 'No client JSON file found'

print allExistingClients
aaaClient = PLCClient()
aaaClient.fromDict(allExistingClients)
print aaaClient.ClientName
print aaaClient.ControlList[0].ControlName
print aaaClient.GetClientString()