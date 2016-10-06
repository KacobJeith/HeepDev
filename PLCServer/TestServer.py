#!/usr/bin/env python 

""" 
A simple echo server 
""" 

def WriteClientList(clientList, filename) :
	outFile = open(filename, 'w')
	for x in range(0, len(clientList)) :
		outFile.write(clientList[x].GetClientString())
	outFile.close()

def ReadClientList(filename) :
	clientList = []
	try :
		inFile = open(filename, 'r')
		while 1:
			curStr = inFile.readline()

			if len(curStr) > 0 :
				stringList = curStr.split(',')
				if len(stringList) == 3 :
					newClient = PLCClient(int(stringList[1]), stringList[0], stringList[2], [])
					clientList.append(newClient)
			else :
				break
		inFile.close()
	except :
		print 'No client file found'
	return clientList

def AddClientToList(clientList, newClient) :
	addClient = 1
	for x in range(0, len(clientList)) :
		if clientList[x].IPAddress == newClient.IPAddress :
			addClient = 0
			break

	if addClient :
		clientList.append(newClient)

	return clientList


import socket 
from PLCClient import PLCClient
from ControlValue import ControlValue

clientList = []

filename = 'clientList.tbl'
clientList = ReadClientList(filename)

host = '' 
port = 5000 
backlog = 5 
size = 1024 
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) 
s.bind((host,port)) 
s.listen(backlog) 
while 1: 
    client, address = s.accept() 
    data = client.recv(size) 
    print "Client Address: ", address[0]
    controlList = []
    controlList.append(ControlValue(100, 2, 'Slider1'))
    controlList.append(ControlValue(200, 100, 'Slider2'))
    newClient = PLCClient(0, address[0], 'TestClient', controlList)
    AddClientToList(clientList, newClient)
    WriteClientList(clientList, filename)
    print "Received Data: ", data
    if data: 
        client.send(data) 
    client.close()