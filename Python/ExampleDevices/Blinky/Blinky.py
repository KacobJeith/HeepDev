import sys
sys.path.insert(0, '../CommonLibrary')
from ControlValue import ControlValue
from Device import Device
from ServerlessDevice import ServerlessDeviceConnection
from random import randint
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
		return
		# print "Light is ", lightOn

def SetupDeviceConnection() :
	deviceConnection = ServerlessDeviceConnection()
	BlinkyLEDDevice = Device()
	# BlinkyLEDDevice.DeviceID = 444
	BlinkyLEDDevice.DeviceID = randint(1,444)
	BlinkyLEDDevice.SetDeviceName('BlinkyLED'+str(BlinkyLEDDevice.DeviceID))
	OnOffControls = ControlValue()
	OnOffControls.ControlName = 'LEDState'+str(BlinkyLEDDevice.DeviceID)
	OnOffControls.ControlValueType = OnOffControls.Range
	OnOffControls.ControlID = 3
	BlinkyLEDDevice.ControlList.append(OnOffControls)
	deviceConnection.SetDeviceData(BlinkyLEDDevice)
	return deviceConnection

# Setup Client Connection
Device = SetupDeviceConnection()
Device.StartHeepDeviceServerThread()

# Device1 = SetupDeviceConnection()
# Device1.StartHeepDeviceServerThread()

# Device2 = SetupDeviceConnection()
# Device2.StartHeepDeviceServerThread()
# Device3 = SetupDeviceConnection()
# Device3.StartHeepDeviceServerThread()
# Device4 = SetupDeviceConnection()
# Device4.StartHeepDeviceServerThread()

print 'Waiting for changes'
while 1 :
	ToggleLight(Device.deviceData.ControlList[0].CurCtrlValue)
