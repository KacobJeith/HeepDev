import socket
import json
import sys
sys.path.insert(0, '../CommonLibrary')

from ControlValue import ControlValue
from PLCClient import PLCClient

class ServerConnection:

	sock = socket.socket()
	fileName = "clientList.tbl"
	fileNameJSON = "clientList.json"
	TCP_PORT = 5000
	clientList = []
	host = ''
	backlog = 5 
	size = 1024 

	def __init__(self):
		self.ReadClientListJSON()
		return

	def WriteClientListJSON(self) :

		clientDictList = []
		for x in range(0, len(self.clientList)) :
			newClient = self.clientList[x].toJSONDict()
			clientDictList.append(newClient)

		with open(self.fileNameJSON, 'w') as f:
			json.dump(clientDictList, f, sort_keys=True, indent=4, separators=(',', ': '))
		return

	def ReadClientListJSON(self) :
		self.clientList = []

		try :
			with open (self.fileNameJSON, 'r') as inFile:
				allExistingClients = json.load(inFile)

			for x in range(0, len(allExistingClients)) :
				newClient = PLCClient()
				newClient.fromDict(allExistingClients[x])
				self.clientList.append(newClient)
		except :
			print 'No client file found'
		return

	def AddClientToList(self, newClient) :
		addClient = 1
		for x in range(0, len(self.clientList)) :
			if self.clientList[x].IPAddress == newClient.IPAddress :
				addClient = 0
				self.clientList[x] = newClient
				print 'Client already in list'
				break

		if addClient :
			self.clientList.append(newClient)

		return self.clientList


	def AddClient(self, clientString, address) :
		print "Client Address: ", address[0]
		newClient = PLCClient()
		newClient.SetClientFromString(clientString)
		newClient.IPAddress = address[0]
		self.AddClientToList(newClient)

		self.WriteClientListJSON()

		return 'Client Added'

	def GetQueuedControlValues(self, address) :
		IPAddress = address[0]
		for x in range(0, len(self.clientList)) :
			if IPAddress == self.clientList[x].IPAddress :
				return self.clientList[x].GetQueuedControlString()

	def ParseClientInput(self, data, address) :
		IsPLCServerString = 'IsPLCServer'
		EchoString = 'Echo'
		NewConnectString = 'NewConnect'
		GetQueuedDataString = 'GetQueuedControlData'

		commandDataSplit = data.split(':')
		print commandDataSplit

		if commandDataSplit[0] == IsPLCServerString :
			return 'Yes'
		elif commandDataSplit[0] == EchoString :
			return commandDataSplit[1]
		elif commandDataSplit[0] == NewConnectString :
			return self.AddClient(commandDataSplit[1], address)
		elif commandDataSplit[0] == GetQueuedDataString :
			return self.GetQueuedControlValues(address)

		return 'null'


	def ListenToNetwork(self) :

		self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		self.sock.bind((self.host, self.TCP_PORT)) 
		self.sock.listen(self.backlog)

		while 1: 
			client, address = self.sock.accept() 
			data = client.recv(self.size) 

			returnData = self.ParseClientInput(data, address)
			
			if data: 
				client.send(returnData) 
			client.close() 
