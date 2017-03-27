from ServerlessClient import ServerlessClientConnection

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from Vertex import Vertex

functionalClient = PLCClient()
functionalClient.ClientID = 666
functionalClient.ClientName = 'Hi There'
functionalClient.ControlList.append(ControlValue())
OnOffControls = ControlValue()
OnOffControls.ControlValueType = OnOffControls.OnOff
OnOffControls.ControlName = 'Party' 
functionalClient.ControlList.append(OnOffControls)

client = ServerlessClientConnection()

client.SetClientData(functionalClient)

client.StartHeepClientServer()