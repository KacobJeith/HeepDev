#!/usr/bin/env python 

""" 
A simple echo server 
""" 

from PLCServer import ServerConnection

server = ServerConnection();
clientList = server.ReadClientList()
print clientList

server.ListenToNetwork();