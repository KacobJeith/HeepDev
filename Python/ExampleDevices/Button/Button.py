import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from Device import Device
from ServerlessDevice import ServerlessDeviceConnection
import time

onRaspPi = 0

def SetupDeviceConnection() :
	deviceConnection = ServerlessDeviceConnection()
	ButtonDevice = Device()
	ButtonDevice.DeviceID = 123487271
	ButtonDevice.SetDeviceName('DifferentButton')
	outControl = ControlValue()
	outControl.ControlName = 'ButtonDerpity'
	outControl.ControlDirection = outControl.Output
	outControl.ControlValueType = outControl.OnOff
	outControl.ControlID = 0
	ButtonDevice.ControlList.append(outControl)

	deviceConnection.SetDeviceData(ButtonDevice)
	return deviceConnection

def CheckButtonPress () :
	return buttonPressed

# Setup Client Connection
device = SetupDeviceConnection()
device.StartHeepDeviceServerThread()

lightState = 1
buttonPressed = 0

if onRaspPi ==1 :
	import RPi.GPIO as GPIO
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(12, GPIO.IN, pull_up_down=GPIO.PUD_UP)

print 'Running!'
while 1 :

	if onRaspPi == 0 :
		var = raw_input("Do you wanna press the button (y/*): ")
		if var == 'y' :
			buttonPressed = 1
		else :
			buttonPressed = 0
	else :
		if GPIO.input(12) == 0 :
			time.sleep(0.2)
			buttonPressed = 1

	if buttonPressed == 1 :
		buttonPressed = 0
		device.SendOutput(0, lightState)
		if lightState == 1 : 
			lightState = 0
		else :
			lightState = 1
