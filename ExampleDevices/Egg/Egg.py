# Servo Control
import sys
sys.path.insert(0, '../../CommonLibrary')
sys.path.insert(0, '../../Client')
from ControlValue import ControlValue
from PLCClient import PLCClient
from ClientConnection import ClientConnection
import time

def SetupClientConnection() :
	client = ClientConnection()
	EggClient = PLCClient()
	EggClient.ClientName = 'SenorEgg'
	EggClient.ClientID = 10245

	EggControlz = ControlValue()
	EggControlz.ControlValueType = EggControlz.Range
	EggControlz.ControlName = 'Yolk'
	EggControlz.ControlValueType = EggControlz.OnOff
	EggClient.ControlList.append(EggControlz)
	client.SetClientData(EggClient)
	return client

def MoveServo(isRaspPi, state) :
	if isRaspPi :
		if state :
			wiringpi.pwmWrite(18, 200)
   		else :
			wiringpi.pwmWrite(18, 100)
		return

	print 'Time State: ' + str(state)
	return


isRaspPi = 0
currentValue = 0

if isRaspPi : 
	import wiringpi

	# use 'GPIO naming'
	wiringpi.wiringPiSetupGpio()
	 
	# set #18 to be a PWM output
	wiringpi.pinMode(18, wiringpi.GPIO.PWM_OUTPUT)
	 
	# set the PWM mode to milliseconds stype
	wiringpi.pwmSetMode(wiringpi.GPIO.PWM_MODE_MS)
	 
	# divide down clock
	wiringpi.pwmSetClock(192)
	wiringpi.pwmSetRange(2000)
	 
	delay_period = 0.01

# Setup Client Connection
client = SetupClientConnection()
client.Connect()
client.SendClientDataToServer()
client.StartInterruptServerThread()
 
print 'Waiting for changes'
while True:
	MoveServo(isRaspPi, client.clientData.ControlList[0].CurCtrlValue)

	
