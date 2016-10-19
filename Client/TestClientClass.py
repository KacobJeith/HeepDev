from ClientConnection import ClientConnection
import sys
sys.path.insert(0, '../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient

client = ClientConnection()

functionalClient = PLCClient()
functionalClient.ClientName = 'This is a Test'
functionalClient.ControlList.append(ControlValue())
client.SetClientData(functionalClient)

client.Connect()