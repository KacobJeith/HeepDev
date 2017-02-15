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

## Running the Heep Server
1. Clone the repo
2. Open a terminal and navigate to the FrontEnd/FlowChart directory
3. Type `npm install` to install all front end dependencies.
4. Type `npm run bs` to build and start the FlowChart
5. Open a terminal and navigate to the Server directory
6. Type `python TestPLCServer.py` to start the server that will listen to devices on the network.
7. Connect Devices and view the front end by opening a web browser and going to your-IP:3001

## Heep General Architecture

### Software Design for Sending

![alt text](Architecture Drawings/HeepBackendSending.png "Sending")

### Software Design for Receiving

![alt text](Architecture Drawings/HeepBackendReceiving.png "Sending")