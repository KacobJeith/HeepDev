import sys
sys.path.insert(0, '../../CommonLibrary')
sys.path.insert(0, '../../Client')
from ControlValue import ControlValue
from PLCClient import PLCClient
from ClientConnection import ClientConnection
from Vertex import Vertex
import time
from threading import Thread

onRaspPi = 0

def SetupClientConnection() :
	client = ClientConnection()
	ButtonClient = PLCClient()
	ButtonClient.ClientName = 'Button'
	ButtonClient.ClientID = 001
	ButtonClient.IconName = 'power-button'
	outControl = ControlValue()
	outControl.ControlName = 'ButtonOut'
	outControl.ControlDirection = outControl.Output
	ButtonClient.ControlList.append(outControl)
	
	# myVertex = Vertex()
	# myVertex.inputName = 'LEDState'
	# myVertex.outputName = outControl.ControlName
	# myVertex.destinationID = 123456
	# myVertex.sourceID = 666
	# myVertex.destinationIP = '192.168.0.105'
	# ButtonClient.AddVertex(myVertex)

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
		client.clientData.SetVerticesFromString(client.GetVerticesFromServer())
		buttonPressed = 0
		client.SendOutput('ButtonOut', lightState)
		if lightState == 1 : 
			lightState = 0
		else :
			lightState = 1
