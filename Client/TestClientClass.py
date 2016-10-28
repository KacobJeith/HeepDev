from ClientConnection import ClientConnection
import sys
sys.path.insert(0, '../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient

client = ClientConnection()

functionalClient = PLCClient()
functionalClient.ClientName = 'This is not a Test'
functionalClient.ControlList.append(ControlValue())
OnOffControls = ControlValue()
OnOffControls.ControlName = 'gear' 
functionalClient.ControlList.append(OnOffControls)
client.SetClientData(functionalClient)

client.Connect()
print client.SendClientDataToServer()
print client.GetClientList()
print client.UpdateClientControl('10.0.0.69', 'gear', 4)
print client.GetQueuedCommandsFromServer()
print client.GetQueuedCommandsFromServer()

for x in range (0, 20) :
	print client.EchoDataFromServer(str(x))
	