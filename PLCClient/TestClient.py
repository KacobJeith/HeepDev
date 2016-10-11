import socket

doSearch = 1
TCP_STUB = '1.1.1.'
TCP_IP = 'none'
TCP_PORT = 5000
BUFFER_SIZE = 1024
MESSAGE = "Hello, World!"
fileName = "ServerTable.tbl"

foundServerIP = "NONE"

try: 
	ipv4 = [(s.connect(('8.8.8.8', 53)), s.getsockname()[0], s.close()) for s in [socket.socket(socket.AF_INET, socket.SOCK_DGRAM)]][0][1].split('.')
	TCP_STUB = '.'.join(ipv4[0:3]) + '.';
	print TCP_STUB
except:
	print 'No IPv4 Address Available'


try:
	myFile = open(fileName, 'r')
	ipStr = myFile.readline()
	myFile.close()
	if len(ipStr) > 0 :
		ipStr = ipStr.split(":")
		ipStr = ipStr[1].replace("\n", "")
		doSearch = 0
		TCP_IP = ipStr
except:
	print 'No Server Table'

ipList = []

if doSearch == 1 :
	for x in range(0, 255) :
	
		if x < 10 :
			TCP_IP = TCP_STUB + '00' + str(x)
		elif x < 100 :
			TCP_IP = TCP_STUB + '0' + str(x)
		else :
			TCP_IP = TCP_STUB + str(x)
	
		print TCP_IP
	
		s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		s.settimeout(0.1)

		try:
			s.connect((TCP_IP, TCP_PORT))
			s.send(MESSAGE)
			data = s.recv(BUFFER_SIZE)
			s.close()
			print "received data:", data
			if data == MESSAGE :
				foundServerIP = TCP_IP
				ipList.append(foundServerIP)
				s.close()
				writeFile = open('ServerTable.tbl', 'w')

				if len(ipList) > 0 :
					for x in range(0, len(ipList)) :
						writeFile.write("Server:")
						writeFile.write(ipList[x])
						writeFile.write('\n')
					writeFile.close()
				break;
		except:
			print 'failed'
else :

	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.settimeout(0.1)
	try:
		s.connect((TCP_IP, TCP_PORT))
		s.send(MESSAGE)
		data = s.recv(BUFFER_SIZE)
		s.close()
		print "received data:", data
		if data == MESSAGE :
			print 'Worked!'
	except:
		print 'failed'
		s.close()