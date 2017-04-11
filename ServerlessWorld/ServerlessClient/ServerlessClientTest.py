from ServerlessClient import ServerlessClientConnection

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from Vertex import Vertex
from CommonDataTypes import HeepIPAddress

functionalClient = PLCClient()
functionalClient.ClientID = 1234
functionalClient.SetClientFrontEndXY(100, 287)
functionalClient.SetIconInformation(1, [chr(3), chr(4), chr(12), chr(41)]) 
functionalClient.SetClientName("SWItCHLET")
OnOffControls = ControlValue()
OnOffControls.ControlValueType = OnOffControls.OnOff
OnOffControls.ControlDirection = 1
OnOffControls.ControlName = 'DrPepper' 
OnOffControls.ControlID = 2
functionalClient.ControlList.append(OnOffControls)

AnotherControl = ControlValue()
AnotherControl.ControlValueType = AnotherControl.OnOff
AnotherControl.ControlDirection = 1
AnotherControl.ControlName = 'Sprite'
AnotherControl.ControlID = 1
functionalClient.ControlList.append(AnotherControl)

Output1 = ControlValue()
Output1.ControlValueType = Output1.Range
Output1.ControlName = 'DMD'
Output1.ControlID = 0
functionalClient.ControlList.append(Output1)

functionalClient.SetServerless(1)

# functionalClient.DumpClientMemory()

client = ServerlessClientConnection()

client.SetClientData(functionalClient)

client.StartHeepClientServer()