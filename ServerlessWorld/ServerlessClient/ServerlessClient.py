import socket

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from OutputData import OutputData
from ActionOpCodeParser import ActionOpCodeParser

class ServerlessClientConnection :

	sock = socket.socket()
	TCP_PORT = 5000
	clientData = PLCClient()

	def __init__(self):
		return

	def SetClientData(self, clientData) :
		self.clientData = clientData

	def SetCommandValueFromInterrupt(self, data) :
		self.clientData.UpdateControlsByString(data)
		return 'Value Set' + ': ' + data

	def SetClientXYPosFromInterrupt(self, data) :
		commandArgs = data.split(',')
		self.clientData.SetClientFrontEndXY(int(commandArgs[0]), int(commandArgs[1]))
		return 'Set Client XY'

	def ParseReceivedData(self, data) :

		retVal = ActionOpCodeParser().GetActionOpCodeFromByteArray(data, self.clientData)
		return retVal

		isHeepDeviceString = 'IsHeepDevice'
		setClientXYString = 'SetXY'
		SetValString = 'SetVal'

		commandDataSplit = data.split(':')
		print commandDataSplit

		if commandDataSplit[0] == isHeepDeviceString :
			return self.clientData.GetClientString()
		elif commandDataSplit[0] == SetValString :
			return self.SetCommandValueFromInterrupt(commandDataSplit[1])
		elif commandDataSplit[0] == setClientXYString :
			return self.SetClientXYPosFromInterrupt(commandDataSplit[1])
			
		return 'null'

	def StartHeepClientServer(self) :
		host = ''
		backlog = 5
		size = 1024

		sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		sock.bind((host, self.TCP_PORT))
		sock.listen(backlog)

		while 1:
			client, address = sock.accept()
			data = client.recv(size)

			returnData = self.ParseReceivedData(data)

			print returnData

			if returnData:
				client.send(returnData)
				print returnData
				print self.clientData.ClientMemory.miscMemory

			client.close()