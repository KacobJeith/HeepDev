import socket
from ControlValue import ControlValue
from PLCClient import PLCClient

class ServerConnection:

	sock = socket.socket()
	fileName = "clientList.tbl"
	fileNameJSON = "clientList.json"
	TCP_PORT = 5000
	clientList = []
	clientObjs = {}
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
		with open(self.fileNameJSON, 'a') as f:
			clientObjsFromStr = json.loads(self.clientObjs)
			json.dump(clientObjsFromStr, f, sort_keys=True, indent=4, separators=(',', ': '))


	def ReadClientListJSON(self) :
		try :
			with open (self,fileNameJSON) as inFile:
				self.clientObjs = json.load(inFile)
				print(self.clientObjs)
		except :
			print 'No client file found'
		return self.clientList

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

	#def AddClientToListJSON(self, newClient) :
	#	return



	def ListenToNetwork(self) :

		self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		self.sock.bind((self.host, self.TCP_PORT)) 
		self.sock.listen(self.backlog)

		while 1: 
			client, address = self.sock.accept() 
			data = client.recv(self.size) 
			print "Client Address: ", address[0]
			controlList = []
			controlList.append(ControlValue(100, 2, 'Slider1'))
			controlList.append(ControlValue(200, 100, 'Slider2'))
			newClient = PLCClient(0, address[0], 'TestClient', controlList)
			self.AddClientToList(newClient)
			self.WriteClientList()

			self.clientObjs = newClient.toJSON()
			self.WriteClientListJSON()
			print "Received Data: ", data
			if data: 
				client.send(data) 
			client.close() 
