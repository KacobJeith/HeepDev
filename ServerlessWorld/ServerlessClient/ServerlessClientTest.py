from ServerlessClient import ServerlessClientConnection

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from Vertex import Vertex

functionalClient = PLCClient()
functionalClient.ClientID = 662345
functionalClient.ClientName = 'Bye There'
OnOffControls = ControlValue()
OnOffControls.ControlValueType = OnOffControls.OnOff
OnOffControls.ControlName = 'PartyPooper' 
functionalClient.ControlList.append(OnOffControls)
functionalClient.SetServerless(1)
functionalClient.SetClientFrontEndXY(100, 287)

client = ServerlessClientConnection()

client.SetClientData(functionalClient)

client.StartHeepClientServer()