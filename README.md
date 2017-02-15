# Heep is Easier to Build, Install, and Use

This repository contains Circuit Board Eagle CAD Files, Server Code, OS Dependent Client Code, and Client Firmware for Heep devices.

Code written for this repository should aim to be testable, elegant, easy to understand, and robust.

## Dependencies

* Heep Server
	* Python 2.7
* Python Clients
	* Python 2.7
* Firmware Clients
	* Modified UIP_Ethernet Library found in Firmware/ArduinoLibrary
	* Teensyduino
* Front End
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

![alt text](Architecture Drawings/HeepBackendReceiving.png "Sending")