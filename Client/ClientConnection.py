import socket
import time
from threading import Thread
import traceback

import sys
sys.path.insert(0, '../CommonLibrary')
from ControlValue import ControlValue
from PLCClient import PLCClient
from OutputData import OutputData

class ClientConnection:

	sock = socket.socket()
	serverIP = "none"
	fileName = "serverTable.tbl"
	TCP_PORT = 5000
	BUFFER_SIZE = 1500

	connectionAttempts = [0]*255
	threadList = []

	clientData = PLCClient()

	def __init__(self):
		return

	def SetClientData(self, clientData) :
		self.clientData = clientData

	def GetServerFromFile(self) :
		myFile = open(self.fileName, 'r')
		ipStr = myFile.readline()
		myFile.close()
		if len(ipStr) > 0 :
			ipStr = ipStr.split(":")
			ipStr = ipStr[1].replace("\n", "")

		return ipStr

	def AttemptIPConnection(self, ipAddress, connectionTableAddr) :
		
		connectMessage = 'IsPLCServer:'
		try :
			sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
			sock.settimeout(0.5)
			sock.connect((ipAddress, self.TCP_PORT))
			sock.send(connectMessage)
			data = sock.recv(self.BUFFER_SIZE)

			print ipAddress
			print ("received data:", data)
			if data == 'Yes' :
				print 'ServerFound'
				self.connectionAttempts[connectionTableAddr] = 1
				self.sock = sock
				return 1
		except : 
			pass

		return 0

	def GetDefaultGateway(self) :		
		ipv4 = ([(s.connect(('8.8.8.8', 53)), s.getsockname()[0], s.close()) 
				for s in [socket.socket(socket.AF_INET, socket.SOCK_DGRAM)]][0][1].split('.'))
		TCP_STUB = '.'.join(ipv4[0:3]) + '.';
		return TCP_STUB

	def WriteServerIPToFile(self, ipAddress) :
		writeFile = open(self.fileName, 'w')
		writeFile.write("Server:")
		writeFile.write(ipAddress)
		writeFile.write('\n')
		writeFile.close()

	def WaitForThreadsToComplete(self) :

		for x in range(0, len(self.threadList)) :
				self.threadList[x].join()

		return

	def SearchForServerIP(self) :
		TCP_STUB = self.GetDefaultGateway()
		self.threadList = []

		for x in range(0, 254) :
			TCP_IP = TCP_STUB + str(x)
			
			try:
				t = Thread( target = self.AttemptIPConnection, args=(TCP_IP, x,) )
				t.start()
				self.threadList.append(t)
			except:
				print ('Failed to schedule search thread')

		self.WaitForThreadsToComplete()

	def GetServerIPFromTable(self) :
		for x in range(0, len(self.connectionAttempts)) :
			if self.connectionAttempts[x] == 1 :
				return self.GetDefaultGateway() + str(x)

		return 'Failed to find server IP'

	def SendDataToServer(self, data) :
		self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		self.sock.settimeout(0.5)
		self.sock.connect((self.serverIP, self.TCP_PORT))
		self.sock.send(data)
		data = self.sock.recv(self.BUFFER_SIZE)
		return data

	def SendDataToClient(self, data, IP) :
		try :
			self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
			self.sock.settimeout(0.5)
			self.sock.connect((IP, self.TCP_PORT))
			self.sock.send(data)
			data = self.sock.recv(self.BUFFER_SIZE)
			return data
		except :
			print 'Failed to connect to client interrupt server'
			return 'Failed'

	def SendClientDataToServer(self) :
		toSend = 'NewConnect:' + self.clientData.GetClientString()
		return self.SendDataToServer(toSend) 

	def EchoDataFromServer(self, data) :
		toSend = 'Echo:' + data
		return self.SendDataToServer(toSend)

	def GetQueuedCommandsFromServer(self) :
		toSend = 'GetQueuedControlData:'
		return self.SendDataToServer(toSend)

	def SetCommandValueFromInterrupt(self, data) :
		self.clientData.UpdateControlsByString(data)
		return 'Value Set'

	def ParseInterruptCommand(self, data, address) :
		IsAliveString = 'IsAlive'
		SetValString = 'SetVal'

		commandDataSplit = data.split(':')
		print commandDataSplit

		if commandDataSplit[0] == IsAliveString :
			return 'Yes'
		elif commandDataSplit[0] == SetValString :
			return self.SetCommandValueFromInterrupt(commandDataSplit[1])

		return 'null'


	def StartInterruptServer(self) :
		host = ''
		backlog = 5
		size = 1024

		sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		sock.bind((host, self.TCP_PORT))
		sock.listen(backlog)

		while 1:
			client, address = sock.accept()
			data = client.recv(size)

			returnData = self.ParseInterruptCommand(data, address)

			if returnData:
				client.send(returnData)
				print returnData
			client.close()

	def StartInterruptServerThread(self) :
		t = Thread( target = self.StartInterruptServer, args=() )
		t.start()

	def GetClientList(self) :
		toSend = 'GetClientList:'
		return self.SendDataToServer(toSend)

	def UpdateClientControl(self, destIP, controlName, controlValue) :
		clientInterruptCommand = 'SetVal:' + controlName + ',' + str(controlValue)
		self.SendDataToClient(clientInterruptCommand, destIP)

		toSend = 'UpdateClientControl:'+destIP+','+controlName+','+str(controlValue)
		return self.SendDataToServer(toSend)

	def SendDataDirectlyToClientIP(self, outData) :
		clientInterruptCommand = 'SetVal:' + outData.inputName + ',' + str(outData.value)
		return self.SendDataToClient(clientInterruptCommand, outData.destinationIP)

	def RequestClientIPFromServerAndSendData(self, outData) : 
		# Get Client Data from server
		# Update Vertex IP
		# Update outData IP
		return self.SendDataDirectlyToClientIP(outData)

	def SearchGloballyForIP(self, outData) :
		# Schedule threads to find outData IP from outData ID
		# Join threads to wait for them to die
		# If not found, return 'Failed'
		# Update Vertex IP 
		# Update outData IP
		return self.SendDataDirectlyToClientIP(outData)

	def SendOutput(self, outputName, value) :
		outputList = self.clientData.QueueOutput(outputName, value)

		print len(outputList)

		for x in range(0, len(outputList)) :
			if self.SendDataDirectlyToClientIP(outputList[x]) == 'Failed' :
				if self.RequestClientIPFromServerAndSendData(outputList[x]) == 'Failed' :
					if self.SearchGloballyForIP(outputList[x]) == 'Failed' :
						toSend = 'UpdateClientControl:'+destIP+','+controlName+','+str(controlValue)
						self.SendDataToServer(toSend)




	def Connect(self) : 
		# First Check for File and try to connect
		ipString = 'None' 
		try :
			ipString = self.GetServerFromFile()
			self.serverIP = ipString
			if self.AttemptIPConnection(ipString, 0) == 1 : 
				return
		except:
			self.sock.close()
			print ('Failed to connect via file')

		try :
			self.SearchForServerIP()
			ipString = self.GetServerIPFromTable()
			self.WriteServerIPToFile(ipString)
			self.serverIP = ipString

			print 'Server IP Found at: ' + self.serverIP

		except:
			self.sock.close()
			print ('Failed to connect to a network')

		return



