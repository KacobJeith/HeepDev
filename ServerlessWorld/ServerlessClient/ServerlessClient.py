import socket

class ServerlessClientConnection :

	sock = socket.socket()
	TCP_PORT = 5000
	BUFFER_SIZE = 1500

	def __init__(self):
		return

	def StartHeepClientServer(self) :
		host = ''
		backlog = 5
		size = 1024

		sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		sock.bind((host, self.TCP_PORT))
		sock.listen(backlog)

		while 1:
			client, address = sock.accept()
			data = client.recv(size)

			print data
			
			client.close()