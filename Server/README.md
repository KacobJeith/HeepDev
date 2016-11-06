# PLC Server API

This documents describes the server API functions for the PLC server. These commands will be used by clients to request information from the server.

## Command List

### Implemented

* IsPLCServer: - The server will return "Yes" if it receives this message

* NewConnect:(ClientInformationString) - Make the server either update the information for a client at this client's IP Address or add a new client with this IP Address and information

* Echo:(InformationToBeRepeated) - Tell the server to echo some string back to the client

* GetQueuedControlData: - Return a list of control updates in tuples ex. ControlName,ControlValue;ControlName2,ControlValue2;

* UpdateClientControl:ClientAddress,ControlName,ControlValue - Update a client's control via the server

* UpdateClientVertex:inputName,outputName,destIP,destID,sourceID - Updates the server's client vertex list for the client that sent the command (client at sourceID)

### Not Implemented

* GetClientList: - Get the list of current clients that the server knows about

* GetClientIP:ClientID - Get the IP Address of the client with this ID

* GetClientVertices:ClientID - Get the vertices for a client with this ID