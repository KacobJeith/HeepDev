import socket

def SendDataToIP(IP, port, data) :
		sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		sock.settimeout(2)
		sock.connect((IP, port))
		sock.send(data)
		data = sock.recv(1024)
		return data

def PrintDataAsByteArray(byteArray) :
	myArr = []
	for x in range(0, len(byteArray)) :
		myArr.append(byteArray[x])

	print myArr

myArray = [chr(0x0B), chr(0x04), chr(0x01), chr(0x01), chr(0x02), chr(0x10)]

myString = ""
for x in range(0, len(myArray)) :
	myString += myArray[x]

data = SendDataToIP("10.135.1.119", 5000, myString)

PrintDataAsByteArray(data)