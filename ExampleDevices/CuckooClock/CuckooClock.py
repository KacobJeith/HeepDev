import sys
sys.path.insert(0, '../../CommonLibrary')
sys.path.insert(0, '../../Client')
from ControlValue import ControlValue
from PLCClient import PLCClient
from ClientConnection import ClientConnection
import datetime

onRaspPi = 0

def SetupClientConnection() :
	client = ClientConnection()
	CuckooClient = PLCClient()
	CuckooClient.ClientName = 'CuckooConductor'
	CuckooClient.ClientID = 1175278
	CuckooClient.IconName = 'cuckoo-clock'

	tock = ControlValue()
	tock.ControlName = 'Tock'
	tock.ControlDirection = tock.Output
	tock.ControlValueType = tock.OnOff
	CuckooClient.ControlList.append(tock)
	
	client.SetClientData(CuckooClient)
	return client

def CheckButtonPress () :
	return buttonPressed

# Setup Client Connection
client = SetupClientConnection()
client.Connect()
client.SendClientDataToServer()

currentValue = 0
currentTime = datetime.datetime.now().time()

print 'Running!'
while 1 :

	if currentTime.second != datetime.datetime.now().time().second :
		currentTime = datetime.datetime.now().time()

		client.clientData.SetVerticesFromString(client.GetVerticesFromServer())
		print currentTime.second
		
		client.SendOutput('Tock', currentValue)
		if currentValue == 1 : 
			currentValue = 0
		else :
			currentValue = 1
