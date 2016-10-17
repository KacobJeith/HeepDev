import socket
import time
from threading import Thread
import traceback

class ClientConnection:

	sock = socket.socket()
	serverIP = "none"
	fileName = "serverTable.tbl"
	TCP_PORT = 5000
	BUFFER_SIZE = 1500

	connectionAttempts = [0]*255
	threadList = []

	def __init__(self):
		return

	def GetServerFromFile(self) :
		myFile = open(self.fileName, 'r')
		ipStr = myFile.readline()
		myFile.close()
		if len(ipStr) > 0 :
			ipStr = ipStr.split(":")
			ipStr = ipStr[1].replace("\n", "")

		return ipStr

	def AttemptIPConnection(self, ipAddress, connectionTableAddr) :
		
		tempMessage = "Replace this message"
		try :
			sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
			sock.settimeout(0.5)
			sock.connect((ipAddress, self.TCP_PORT))
			sock.send(tempMessage)
			data = sock.recv(self.BUFFER_SIZE)

			print ipAddress
			print ("received data:", data)
			if data == tempMessage :
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

	def Connect(self) :
		# First Check for File and try to connect
		ipString = 'None' 
		try :
			ipString = self.GetServerFromFile()
			if self.AttemptIPConnection(ipString, 0) == 1 : 
				return
		except Exception:
			self.sock.close()
			print(traceback.format_exc())
			print ('Failed to connect via file')

		try :
			self.SearchForServerIP()
			ipString = self.GetServerIPFromTable()
			self.WriteServerIPToFile(ipString)

			print ('Server IP Found at: ', ipString)

		except Exception:
			self.sock.close()
			print(traceback.format_exc())
			print ('Failed to connect to a network')


		return


