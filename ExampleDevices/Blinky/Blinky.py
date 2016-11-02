import sys
sys.path.insert(0, '../../CommonLibrary')
sys.path.insert(0, '../../Client')
from ControlValue import ControlValue
from PLCClient import PLCClient
from ClientConnection import ClientConnection
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

def SetupClientConnection() :
	client = ClientConnection()
	BlinkyLEDClient = PLCClient()
	BlinkyLEDClient.ClientName = 'BlinkyLED'
	OnOffControls = ControlValue()
	OnOffControls.ControlValueType = OnOffControls.Range
	OnOffControls.ControlName = 'LEDState'
	BlinkyLEDClient.ControlList.append(OnOffControls)
	client.SetClientData(BlinkyLEDClient)
	return client

# Setup Client Connection
client = SetupClientConnection()
client.Connect()
client.SendClientDataToServer()

counter = 0
client.StartInterruptServerThread()
print 'Waiting for changes'
while 1 :
	ToggleLight(client.clientData.ControlList[0].CurCtrlValue)
