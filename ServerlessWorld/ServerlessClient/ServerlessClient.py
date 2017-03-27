import socket

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from OutputData import OutputData

class ServerlessClientConnection :

	sock = socket.socket()
	TCP_PORT = 5000
	clientData = PLCClient()

	def __init__(self):
		return

	def ParseReceivedData(self, data) :
		isHeepDeviceString = 'IsHeepDevice'

		commandDataSplit = data.split(':')
		print commandDataSplit

		if commandDataSplit[0] == isHeepDeviceString :
			return self.clientData.GetClientString()

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

			if returnData:
				client.send(returnData)
				print returnData

			client.close()