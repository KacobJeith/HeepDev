from ServerlessClient import ServerlessClientConnection

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from Vertex import Vertex

functionalClient = PLCClient()
functionalClient.ClientID = 666
functionalClient.SetClientName("This Guy")
OnOffControls = ControlValue()
OnOffControls.ControlValueType = OnOffControls.OnOff
OnOffControls.ControlName = 'PartyPooper' 
functionalClient.ControlList.append(OnOffControls)

AnotherControl = ControlValue()
AnotherControl.ControlValueType = AnotherControl.OnOff
AnotherControl.ControlName = 'Dr Pepper'
functionalClient.ControlList.append(AnotherControl)

functionalClient.SetServerless(1)
functionalClient.SetClientFrontEndXY(100, 287)

functionalClient.DumpClientMemory()

client = ServerlessClientConnection()

client.SetClientData(functionalClient)

client.StartHeepClientServer()