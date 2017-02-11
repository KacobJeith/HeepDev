import sys
sys.path.insert(0, '../../CommonLibrary')
sys.path.insert(0, '../../Client')
from ControlValue import ControlValue
from PLCClient import PLCClient
from ClientConnection import ClientConnection
import time
import requests

def TurnHue1LightOn :
	payload = "{\"on\" : true}"
	r=requests.put("http://10.0.0.186/api/5Fi4nBQQNpI7Bw449Yd1-Aj3QwsrQpLGpeJkVNtI/lights/1/state", data=payload)

def TurnHue1LightOff :
	payload = "{\"on\" : false}"
	r=requests.put("http://10.0.0.186/api/5Fi4nBQQNpI7Bw449Yd1-Aj3QwsrQpLGpeJkVNtI/lights/1/state", data=payload)

def TurnHue2LightOn :
	payload = "{\"on\" : true}"
	r=requests.put("http://10.0.0.186/api/5Fi4nBQQNpI7Bw449Yd1-Aj3QwsrQpLGpeJkVNtI/lights/2/state", data=payload)

def TurnHue2LightOff :
	payload = "{\"on\" : false}"
	r=requests.put("http://10.0.0.186/api/5Fi4nBQQNpI7Bw449Yd1-Aj3QwsrQpLGpeJkVNtI/lights/2/state", data=payload)

light1PrevState = 0;
light2PrevState = 0;

def ToggleLight1(lightOn) :
	print "Light 1 is ", lightOn

	if lightOn != light1PrevState :
		light1PrevState = lightOn
		if lightOn : 
			TurnHue1LightOn()
		else
			TurnHue1LightOff()

def ToggleLight2(lightOn) :
	print "Light 2 is ", lightOn

	if lightOn != light2PrevState :
		light2PrevState = lightOn
		if lightOn : 
			TurnHue2LightOn()
		else
			TurnHue2LightOff()

def SetupClientConnection() :
	client = ClientConnection()
	BlinkyLEDClient = PLCClient()
	BlinkyLEDClient.ClientName = 'HueBulbs'
	BlinkyLEDClient.ClientID = 5123085
	BlinkyLEDClient.IconName = 'light-bulb'

	Hue1OnOff = ControlValue()
	Hue1OnOff.ControlName = 'HueLight1'
	Hue1OnOff.ControlValueType = OnOffControls.OnOff
	BlinkyLEDClient.ControlList.append(Hue1OnOff)

	Hue2OnOff = ControlValue()
	Hue2OnOff.ControlName = 'HueLight2'
	Hue2OnOff.ControlValueType = OnOffControls.OnOff
	BlinkyLEDClient.ControlList.append(Hue2OnOff)

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
	ToggleLight1(client.clientData.ControlList[0].CurCtrlValue)
	ToggleLight2(client.clientData.ControlList[1].CurCtrlValue)
