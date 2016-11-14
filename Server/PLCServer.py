import socket
import json
from threading import Thread
import time
import sys
sys.path.insert(0, '../CommonLibrary')

from ControlValue import ControlValue
from PLCClient import PLCClient
from Vertex import Vertex

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
			if self.clientList[x].ClientID == newClient.ClientID :
				addClient = 0
				vertexList = self.clientList[x].VertexList
				newClient.VertexList = vertexList
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

	def GetQueuedControlValues(self, sourceID) :
		for x in range(0, len(self.clientList)) :
			if int(sourceID) == self.clientList[x].ClientID :
				return self.clientList[x].GetQueuedControlString()

		return 'Client not Found'

	def GetClientList(self) :
		print 'Implement Get Client List command'
		return 'GetClientList:Not Implemented'

	def QueueControlChange(self, commandData) :
		commandList = commandData.split(',')
		destID = int(commandList[0])
		destInputName = commandList[1]
		destValue = int(commandList[2])

		for x in range(0, len(self.clientList)) :
			if self.clientList[x].ClientID == destID :
				self.clientList[x].QueueControlByName(destInputName, destValue)
				return 'Command Queued'

		return 'Client not found'

	def UpdateClientVertex(self, commandData) :
		# Parse first vertex to get source ID.
		# TODO: Do this part better
		splitData = commandData.split(';')
		testVertex = Vertex()
		testVertex.SetVertexFromString(splitData[0])
		sourceID = testVertex.sourceID

		for x in range(0, len(self.clientList)) :
			if self.clientList[x].ClientID == sourceID :
				self.clientList[x].SetVerticesFromString(commandData)
				self.WriteClientListJSON()
				return 'Vertices Set'

		return 'Client not found'

	def GetClientVertices(self, commandData) :
		myClientID = int(commandData)
		for x in range(0, len(self.clientList)) :
			if self.clientList[x].ClientID == myClientID :
				return self.clientList[x].GetVerticesString()

		return 'Client not found'


	def ParseClientInput(self, data, address) :
		IsPLCServerString = 'IsPLCServer'
		EchoString = 'Echo'
		NewConnectString = 'NewConnect'
		GetQueuedDataString = 'GetQueuedControlData'
		GetClientListString = 'GetClientList'
		QueueControlChangeString = 'QueueControlChange'
		UpdateClientVertexString = 'UpdateClientVertex'
		GetClientVertexString = 'GetClientVertices'

		commandDataSplit = data.split(':')
		print commandDataSplit

		if commandDataSplit[0] == IsPLCServerString :
			return 'Yes'
		elif commandDataSplit[0] == EchoString :
			return commandDataSplit[1]
		elif commandDataSplit[0] == NewConnectString :
			return self.AddClient(commandDataSplit[1], address)
		elif commandDataSplit[0] == GetQueuedDataString :
			return self.GetQueuedControlValues(commandDataSplit[1])
		elif commandDataSplit[0] == GetClientListString :
			return self.GetClientList()
		elif commandDataSplit[0] == QueueControlChangeString :
			return self.QueueControlChange(commandDataSplit[1])
		elif commandDataSplit[0] == UpdateClientVertexString :
			return self.UpdateClientVertex(commandDataSplit[1])
		elif commandDataSplit[0] == GetClientVertexString :
			return self.GetClientVertices(commandDataSplit[1])

		return 'null'

	def AddCommandsToQueue(self, commands) :
		for x in range(0, len(commands)) :
			splitString = commands[x].split(',')
			for x in range(0, len(self.clientList)) :
				if int(splitString[0]) == self.clientList[x].ClientID :
					commandVals = []
					commandVals.append(splitString[1])
					commandVals.append(splitString[2])
					print self.clientList[x].ClientName + ',' + commandVals[0] + ',' + commandVals[1]
					self.clientList[x].QueueControlByName(commandVals[0], commandVals[1])

	def SendCommandToClientInterrupt(self, IP, data) :
		try :
			sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
			sock.settimeout(0.5)
			sock.connect((IP, self.TCP_PORT))
			sock.send(data)
			data = sock.recv(self.size)
		except :
			print 'Failed to contact client interrupt server'

	def CheckVertexEquality(self, client, vertex) :
		for x in range(0, len(client.VertexList)) :
			if client.VertexList[x].destinationID == vertex.destinationID :
				if client.VertexList[x].inputName == vertex.inputName :
					if client.VertexList[x].outputName == vertex.outputName :
						return 1

		return 0

	def SetVertexFromFrontEnd(self, commandStr) :
		newVertex = Vertex()
		newVertex.SetVertexFromString(commandStr)
		for x in range(0, len(self.clientList)) :
			if self.clientList[x].ClientID == newVertex.sourceID :
				if self.CheckVertexEquality(self.clientList[x], newVertex) :
					return 'Vertex Already Set'

				self.clientList[x].VertexList.append(newVertex)
				self.WriteClientListJSON()
				return 'Vertex Set'

		return 'Client not found'

	def GetIPFromClientID(self, clientID) :
		for x in range(0,len(self.clientList)) :
			if self.clientList[x].ClientID == int(clientID) :
				return self.clientList[x].IPAddress

		return 'Not Found'

	def SetPositionFromFrontEnd(self, commandStr) :
		newPosition = commandStr.split(',')
		print newPosition
		print self.clientList[0]

		for x in range(0, len(self.clientList)) :
			print self.clientList[x].ClientID
			if str(self.clientList[x].ClientID) == newPosition[0] :
				self.clientList[x].Position = {'top': float(newPosition[1]), 'left': float(newPosition[2])}
				self.WriteClientListJSON()
				return 'Updated Client Position'

		return 'Client not found'

	def SetCommandFromFrontEnd(self, commandStr) :
		commands = []
		commands.append(commandStr)
		newL = commandStr.split(',')
		data = 'SetVal:' + newL[1] + ',' + newL[2]
		IP = self.GetIPFromClientID(newL[0])
		self.SendCommandToClientInterrupt(IP, data)
		self.AddCommandsToQueue(commands)

		return 'Command Queued'

	def ParseFrontEndCommands(self, command) :
		SetVertexString = 'SetVertex'
		SetCommandString = 'SetCommand'
		SetPositionString = 'SetPosition'

		print command

		commandDataSplit = command.split(':')

		if commandDataSplit[0] == SetVertexString :
			return self.SetVertexFromFrontEnd(commandDataSplit[1])
		elif commandDataSplit[0] == SetCommandString :
			return self.SetCommandFromFrontEnd(commandDataSplit[1])
		elif commandDataSplit[0] == SetPositionString :
			return self.SetPositionFromFrontEnd(commandDataSplit[1])

		return 'Failed to Find Command'

	def QueueCurrentCommands(self) :
		fileName = 'CommandQueue.tmp'
		while 1 :

			with open (fileName, 'r') as inFile :
				for line in inFile :
					if len(line) > 0 :
						print self.ParseFrontEndCommands(line)

			with open(fileName, "w") :
				pass
			time.sleep(0.1)

	def StartQueueCommandLoop(self) :
		try:
			t = Thread( target = self.QueueCurrentCommands, args=() )
			t.start()
		except:
			print ('Failed to schedule search thread')


	def ListenToNetwork(self) :

		self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		self.sock.bind((self.host, self.TCP_PORT))
		self.sock.listen(self.backlog)

		self.StartQueueCommandLoop()

		while 1:

			client, address = self.sock.accept()

			data = client.recv(self.size)

			returnData = self.ParseClientInput(data, address)

			if data:
				client.send(returnData)
			client.close()
