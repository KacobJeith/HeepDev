from ServerlessDevice import ServerlessDeviceConnection

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from Device import Device
from Vertex import Vertex
from CommonDataTypes import HeepIPAddress

functionalDevice = Device()
functionalDevice.DeviceID = 5678
functionalDevice.SetFrontEndXY(100, 287)
functionalDevice.SetIconInformation(1, [chr(3), chr(4), chr(12), chr(41)]) 
functionalDevice.SetDeviceName("JERCERB")
OnOffControls = ControlValue()
OnOffControls.ControlValueType = OnOffControls.OnOff
OnOffControls.ControlDirection = 1
OnOffControls.ControlName = 'Fig' 
OnOffControls.ControlID = 2
functionalDevice.ControlList.append(OnOffControls)

AnotherControl = ControlValue()
AnotherControl.ControlValueType = AnotherControl.OnOff
AnotherControl.ControlDirection = 1
AnotherControl.ControlName = 'Pretzel'
AnotherControl.ControlID = 1
functionalDevice.ControlList.append(AnotherControl)

Output1 = ControlValue()
Output1.ControlValueType = Output1.Range
Output1.ControlName = 'Fruity'
Output1.ControlID = 0
functionalDevice.ControlList.append(Output1)

device = ServerlessDeviceConnection()

device.SetDeviceData(functionalDevice)

device.StartHeepDeviceServer()