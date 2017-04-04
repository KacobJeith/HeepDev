from ServerlessClient import ServerlessClientConnection

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from Vertex import Vertex

functionalClient = PLCClient()
functionalClient.ClientID = 3498751234
functionalClient.SetClientName("Sunest")
OnOffControls = ControlValue()
OnOffControls.ControlValueType = OnOffControls.OnOff
OnOffControls.ControlName = 'DrPepper' 
functionalClient.ControlList.append(OnOffControls)

AnotherControl = ControlValue()
AnotherControl.ControlValueType = AnotherControl.OnOff
AnotherControl.ControlName = 'Sprite'
functionalClient.ControlList.append(AnotherControl)


Output1 = ControlValue()
Output1.ControlValueType = Output1.Range
Output1.ControlDirection = 1
Output1.ControlName = 'DMD'
functionalClient.ControlList.append(Output1)

Output2 = ControlValue()
Output2.ControlValueType = Output2.Range
Output2.ControlDirection = 1
Output2.ControlName = 'Surge'
functionalClient.ControlList.append(Output2)

Output3 = ControlValue()
Output3.ControlValueType = Output3.Range
Output3.ControlDirection = 1
Output3.ControlName = 'Pepsi'
functionalClient.ControlList.append(Output3)

functionalClient.SetServerless(1)
functionalClient.SetClientFrontEndXY(100, 287)

client = ServerlessClientConnection()

client.SetClientData(functionalClient)

client.StartHeepClientServer()