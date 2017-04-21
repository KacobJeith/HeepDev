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

def GetIsDeviceArray() :
	myArray = [chr(0x09), chr(0x04), chr(0x01), chr(0x00), chr(0x02), chr(0x20)]
	return myArray

def GetSetXYPositionArray() :
	myArray = [chr(0x0B), chr(0x04), chr(0x01), chr(0x00), chr(0x02), chr(0x20)]
	return myArray

def GetSetValueArray() :
	myArray = [chr(0x0A), chr(0x02), chr(0x00), chr(0x02)]
	return myArray

myArray = GetSetValueArray()

myString = ""
for x in range(0, len(myArray)) :
	myString += myArray[x]

data = SendDataToIP("192.168.1.169", 5000, myString)

PrintDataAsByteArray(data)