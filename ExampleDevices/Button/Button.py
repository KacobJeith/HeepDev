import sys
sys.path.insert(0, '../../CommonLibrary')
sys.path.insert(0, '../../Client')
from ControlValue import ControlValue
from PLCClient import PLCClient
from ClientConnection import ClientConnection
import time
from threading import Thread

onRaspPi = 0

def SetupClientConnection() :
	client = ClientConnection()
	ButtonClient = PLCClient()
	ButtonClient.ClientName = 'Button'
	client.SetClientData(ButtonClient)
	return client

def CheckButtonPress () :
	return buttonPressed

# Setup Client Connection
client = SetupClientConnection()
client.Connect()
client.SendClientDataToServer()
lightState = 1
buttonPressed = 0

if onRaspPi ==1 :
	import RPi.GPIO as GPIO
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(17, GPIO.OUT, initial=GPIO.LOW)

print 'Running!'
while 1 :

	if onRaspPi == 0 :
		var = raw_input("Do you wanna press the button (y/n): ")
		if var == 'y' :
			buttonPressed = 1
		else :
			buttonPressed = 0

	if buttonPressed == 1 :
		buttonPressed = 0
		client.UpdateClientControl('10.0.0.196', 'LEDState', lightState)
		if lightState == 1 : 
			lightState = 0
		else :
			lightState = 1