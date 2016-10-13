import socket

class ClientConnection:

	sock = socket.socket()
	serverIP = "none"
	fileName = "serverTable.tbl"
	TCP_PORT = 5000
	BUFFER_SIZE = 1500

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

	def AttemptIPConnection(self, ipAddress) :
		tempMessage = "Replace this message"

		self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		self.sock.settimeout(0.1)
		self.sock.connect((ipAddress, self.TCP_PORT))
		self.sock.send(tempMessage)
		data = self.sock.recv(self.BUFFER_SIZE)

		print ("received data:", data)
		if data == tempMessage :
			print ('Worked!')

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

	def SearchForServerIP(self) :
		TCP_STUB = self.GetDefaultGateway()

		for x in range(0, 255) :
			TCP_IP = TCP_STUB + str(x)
		
			print TCP_IP
		
			try:
				self.AttemptIPConnection(TCP_IP)
				self.WriteServerIPToFile(TCP_IP)
				break;
			except:
				print ('failed')

	def Connect(self) :

		# First Check for File and try to connect
		ipString = 'None' 
		try :
			ipString = self.GetServerFromFile()
			self.AttemptIPConnection(ipString)
			return
		except :
			self.sock.close()
			print ('Failed to connect via file')

		try :
			self.SearchForServerIP()
		except :
			self.sock.close()
			print ('Failed to connect to a network')
		return


