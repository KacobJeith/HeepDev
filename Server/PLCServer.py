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
		return
		
	def WriteClientList(self) :
		outFile = open(self.fileName, 'w')
		for x in range(0, len(self.clientList)) :
			outFile.write(self.clientList[x].GetClientString())
		outFile.close()

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
			with open (fileNameJSON, 'r') as inFile:
				allExistingClients = json.load(inFile)

			for x in range(0, len(allExistingClients)) :
				newClient = PLCClient()
				newClient.fromDict(allExistingClients[0])
				self.clientList.append(newClient)

		except :
			print 'No client file found'
		return

	def ReadClientList(self) :
		try :
			inFile = open(self.fileName, 'r')
			while 1:
				curStr = inFile.readline()

				if len(curStr) > 0 :
					stringList = curStr.split(',')
					if len(stringList) == 3 :
						newClient = PLCClient(int(stringList[1]), stringList[0], stringList[2], [])
						self.clientList.append(newClient)
				else :
					break
			inFile.close()
		except :
			print 'No client file found'
		return self.clientList

	def AddClientToList(self, newClient) :
		addClient = 1
		for x in range(0, len(self.clientList)) :
			if self.clientList[x].IPAddress == newClient.IPAddress :
				addClient = 0
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
		self.WriteClientList()

		self.WriteClientListJSON()

		return 'Client Added'

	def ParseClientInput(self, data, address) :
		IsPLCServerString = 'IsPLCServer'
		EchoString = 'Echo'
		NewConnectString = 'NewConnect'

		commandDataSplit = data.split(':')
		print commandDataSplit

		if commandDataSplit[0] == IsPLCServerString :
			return 'Yes'
		elif commandDataSplit[0] == EchoString :
			return commandDataSplit[1]
		elif commandDataSplit[0] == NewConnectString :
			return self.AddClient(commandDataSplit[1], address)

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
