import socket

import sys
sys.path.insert(0, '../../CommonLibrary')
from ControlValue import ControlValue
from Device import Device
from OutputData import OutputData
from ActionOpCodeParser import ActionOpCodeParser

class ServerlessDeviceConnection :

	sock = socket.socket()
	TCP_PORT = 5000
	deviceData = Device()

	def __init__(self):
		return

	def SetDeviceData(self, deviceData) :
		self.deviceData = deviceData

	def ParseReceivedData(self, data) :

		retVal = ActionOpCodeParser().GetActionOpCodeFromByteArray(data, self.deviceData)
		return retVal

	def StartHeepDeviceServer(self) :
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
				print self.deviceData.DeviceMemory.miscMemory

			client.close()