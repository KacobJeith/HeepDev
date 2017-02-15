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
3. Type `npm install` to install all front end dependencies
4. Type `npm run bs` to build and start the FlowChart
5. Open a terminal and navigate to the Server directory
6. Type `python TestPLCServer.py` to start the server that will listen to devices on the network
7. Connect Devices and view the front end by opening a web browser and going to your-IP:3001

## Running a Heep Client
1. Clone the repo
2. Open a terminal and navigate to a client in the ExampleDevices directory
3. Find the name of the .py file in the example device folder you chose
4. Type `Python device-name.py` in the terminal to start the client
5. The client should show up on the heep server front end

## What is a Heep Client

A Heep client is a named collection of inputs and outputs that communicate with other Heep clients over a line called a "Vertex." Every client contains these components.

* *Name*: The client's name is the word that humans use to identify the client
* *ID*: The ID is a unique number that is used by Heep to identify a client regardless of IP Address or MAC Address

## Heep General Architecture

### Software Design for Sending

![alt text](Architecture Drawings/HeepBackendSending.png "Sending")

### Software Design for Receiving

![alt text](Architecture Drawings/HeepBackendReceiving.png "Sending")