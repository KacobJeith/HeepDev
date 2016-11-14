# PLC Server API

This documents describes the server API functions for the PLC server. These commands will be used by clients to request information from the server.

## From Client Command List

### Implemented

* IsPLCServer: - The server will return "Yes" if it receives this message

* NewConnect:(ClientInformationString) - Make the server either update the information for a client at this client's IP Address or add a new client with this IP Address and information

* Echo:(InformationToBeRepeated) - Tell the server to echo some string back to the client

* UpdateClientVertex:inputName,outputName,destIP,destID,sourceID - Updates the server's client vertex list for the client that sent the command (client at sourceID)

* GetClientVertices:ClientID - Get the vertices for a client with this ID

### Not Implemented

* QueueControlChange:DestID,inputName,Value - Update a client's input value by queing the information on the server. This is typically used as a fallback for a failed interrupt send.

* GetQueuedControlData:sourceID - Return a list of control updates for the client at sourceID in tuples ex. ControlName,ControlValue;ControlName2,ControlValue2;

* GetClientList: - Get the list of current clients that the server knows about

* GetClientIP:ClientID - Get the IP Address of the client with this ID

## From Front End Command List

### Implemented

* SetVertex:inputName,outputName,destIP,destID,sourceID - Set a vertex on a client at a given source ID

* SetCommand:destID,controlName,controlValue

### Not Implemented

