# PLC is the future. 
We are going to revolutionize the way devices interact and the way devices are designed by using existing infrastructures.

## Dependencies
* Python 2.7.12
* Node.js

## Running this code
1. Clone this repo onto multiple machines
2. On the Server System, enter the /PLC/PLCServer directory and type `>>python TestServer.py`
3. On the Client System, enter the /PLC/PLCFrontEnd directory and type `>> node server.js` 
4. On the Client System, go into Chome, and enter your IP address, on port `<IP_ADDRESS:8001>`
5. Click `Test Server`, and a list of all devices on your network will appear

## Heep General Architecture

### Software Design for Sending

![alt text](Architecture Drawings/HeepBackendSending.png "Sending")

### Software Design for Receiving

![alt text](Architecture Drawings/HeepBackEndReceiving.png "Sending")