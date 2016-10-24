# PLC Server API

This documents describes the server API functions for the PLC server. These commands will be used by clients to request information from the server.

## Command List

### Implemented

* IsPLCServer: - The server will return "Yes" if it receives this message

* NewConnect:(ClientInformationString) - Make the server either update the information for a client at this client's IP Address or add a new client with this IP Address and information

* Echo:(InformationToBeRepeated) - Tell the server to echo some string back to the client

### Not Implemented

* GetClientList: - Get the list of current clients that the server knows about

* SendToClient:(ClientAddress,Data) - Send data to another client via the server

* UpdateControl:(ControlName,ControlValue) - Update a control on the server. This is mostly for display purposes