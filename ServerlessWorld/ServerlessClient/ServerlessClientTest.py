from ServerlessClient import ServerlessClientConnection

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from Vertex import Vertex

functionalClient = PLCClient()
functionalClient.ClientID = 3498751234
functionalClient.SetClientName("That Guy")
OnOffControls = ControlValue()
OnOffControls.ControlValueType = OnOffControls.OnOff
OnOffControls.ControlName = 'Poop Her Party' 
functionalClient.ControlList.append(OnOffControls)

AnotherControl = ControlValue()
AnotherControl.ControlValueType = AnotherControl.OnOff
AnotherControl.ControlName = 'Sprite'
functionalClient.ControlList.append(AnotherControl)

functionalClient.SetServerless(1)
functionalClient.SetClientFrontEndXY(100, 287)

client = ServerlessClientConnection()

client.SetClientData(functionalClient)

client.StartHeepClientServer()