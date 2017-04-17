import sys
sys.path.insert(0, '../../CommonLibrary')
sys.path.insert(0, '../../ServerlessWorld/ServerlessDevice')
from ControlValue import ControlValue
from Device import Device
from ServerlessDevice import ServerlessDeviceConnection
import time

onRaspPi = 0

if onRaspPi :
	import RPi.GPIO as GPIO
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(17, GPIO.OUT, initial=GPIO.LOW)

def ToggleLight(lightOn) :
	if onRaspPi :
		if lightOn :
			GPIO.output(17, GPIO.HIGH)
		else :
			GPIO.output(17, GPIO.LOW)
	else :
		print "Light is ", lightOn

def SetupDeviceConnection() :
	deviceConnection = ServerlessDeviceConnection()
	BlinkyLEDDevice = Device()
	BlinkyLEDDevice.DeviceID = 444
	BlinkyLEDDevice.SetDeviceName('BlinkyLED')
	OnOffControls = ControlValue()
	OnOffControls.ControlName = 'LEDState'
	OnOffControls.ControlValueType = OnOffControls.OnOff
	OnOffControls.ControlID = 0
	BlinkyLEDDevice.ControlList.append(OnOffControls)
	deviceConnection.SetDeviceData(BlinkyLEDDevice)
	return deviceConnection

# Setup Client Connection
Device = SetupDeviceConnection()
Device.StartHeepDeviceServerThread()
print 'Waiting for changes'
while 1 :
	ToggleLight(Device.deviceData.ControlList[0].CurCtrlValue)
