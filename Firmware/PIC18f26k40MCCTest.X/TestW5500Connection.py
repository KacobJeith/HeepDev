import socket

ipAddress = '192.168.0.186'
TCP_PORT = 5000
connectMessage = 'James and Jacob are Cute'
BUFFER_SIZE = 1500

try :
	sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	sock.settimeout(0.5)
	sock.connect((ipAddress, TCP_PORT))
	sock.send(connectMessage)
	data = sock.recv(BUFFER_SIZE)

	print ipAddress
	print ("received data:", data)
except : 
	print 'Exception'
	pass
