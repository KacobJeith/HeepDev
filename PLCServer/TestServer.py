#!/usr/bin/env python 

""" 
A simple echo server 
""" 

def WriteClientList(clientList, filename) :
	outFile = open(filename, 'w')
	for x in range(0, len(clientList)) :
		outFile.write(clientList[0])
		outFile.write('\n')
	outFile.close()

def ReadClientList(filename) :
	clientList = []
	try :
		inFile = open(filename, 'r')
		while 1:
			curStr = inFile.readline()
			if len(curStr) > 0 :
				clientList.append(curStr)
			else :
				break
		inFile.close()
	except :
		print 'No client file found'
	return clientList

def AddClientToList(clientList, newClient) :
	addClient = 1
	for x in range(0, len(clientList)) :
		if clientList[x] == newClient :
			addClient = 0
			break

	if addClient :
		clientList.append(newClient)

	return clientList


import socket 

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
    AddClientToList(clientList, address[0])
    WriteClientList(clientList, filename)
    print "Received Data: ", data
    if data: 
        client.send(data) 
    client.close()