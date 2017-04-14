from ServerlessClient import ServerlessClientConnection

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from Device import Device
from Vertex import Vertex
from CommonDataTypes import HeepIPAddress

functionalClient = Device()
functionalClient.ClientID = 5678
functionalClient.SetClientFrontEndXY(100, 287)
functionalClient.SetIconInformation(1, [chr(3), chr(4), chr(12), chr(41)]) 
functionalClient.SetClientName("JERCERB")
OnOffControls = ControlValue()
OnOffControls.ControlValueType = OnOffControls.OnOff
OnOffControls.ControlDirection = 1
OnOffControls.ControlName = 'Fig' 
OnOffControls.ControlID = 2
functionalClient.ControlList.append(OnOffControls)

AnotherControl = ControlValue()
AnotherControl.ControlValueType = AnotherControl.OnOff
AnotherControl.ControlDirection = 1
AnotherControl.ControlName = 'Pretzel'
AnotherControl.ControlID = 1
functionalClient.ControlList.append(AnotherControl)

Output1 = ControlValue()
Output1.ControlValueType = Output1.Range
Output1.ControlName = 'Fruity'
Output1.ControlID = 0
functionalClient.ControlList.append(Output1)

functionalClient.SetServerless(1)

# functionalClient.DumpClientMemory()

client = ServerlessClientConnection()

client.SetClientData(functionalClient)

client.StartHeepClientServer()