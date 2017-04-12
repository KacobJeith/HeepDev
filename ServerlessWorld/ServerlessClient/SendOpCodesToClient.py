import socket

def SendDataToIP(IP, port, data) :
		sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		sock.settimeout(2)
		sock.connect((IP, port))
		sock.send(data)
		data = sock.recv(1024)
		return data

myArray = [chr(0x0A), chr(0x02), chr(0x01), chr(0x01)]

myString = ""
for x in range(0, len(myArray)) :
	myString += myArray[x]

print SendDataToIP("192.168.1.101", 5000, myString)