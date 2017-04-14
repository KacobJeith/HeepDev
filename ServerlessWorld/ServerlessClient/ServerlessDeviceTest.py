from ServerlessDevice import ServerlessDeviceConnection

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from Device import Device
from Vertex import Vertex
from CommonDataTypes import HeepIPAddress

functionDevice = Device()
functionDevice.ClientID = 5678
functionDevice.SetClientFrontEndXY(100, 287)
functionDevice.SetIconInformation(1, [chr(3), chr(4), chr(12), chr(41)]) 
functionDevice.SetClientName("JERCERB")
OnOffControls = ControlValue()
OnOffControls.ControlValueType = OnOffControls.OnOff
OnOffControls.ControlDirection = 1
OnOffControls.ControlName = 'Fig' 
OnOffControls.ControlID = 2
functionDevice.ControlList.append(OnOffControls)

AnotherControl = ControlValue()
AnotherControl.ControlValueType = AnotherControl.OnOff
AnotherControl.ControlDirection = 1
AnotherControl.ControlName = 'Pretzel'
AnotherControl.ControlID = 1
functionDevice.ControlList.append(AnotherControl)

Output1 = ControlValue()
Output1.ControlValueType = Output1.Range
Output1.ControlName = 'Fruity'
Output1.ControlID = 0
functionDevice.ControlList.append(Output1)

functionDevice.SetServerless(1)

# functionalClient.DumpClientMemory()

device = ServerlessDeviceConnection()

device.SetClientData(functionalClient)

device.StartHeepClientServer()