# What is a Heep Client

A Heep client is a named collection of inputs and outputs that communicate with other Heep clients over a line called a "Vertex." Every client contains these 4 components.

* **Name**: The client's name is the word that humans use to identify the client
* **ID**: The ID is a unique number that is used by Heep to identify a client regardless of IP Address or MAC Address
* **ControlValueList**: The control value list contains the list of inputs and outputs that the client will use to communicate with its internal programming
* **VertexList**: The vertex list contains a list of interconnections that describe how control values on one client will communicate with control values on another client.

# PLC Client API

This documents describes the client API functions for the PLC clients. These commands will be used by the server and other clients to request information from the clients.

## Current State

The Python ClientAPI needs some work. It is not completely stable yet.

## Command List

### Implemented

* IsAlive: - Will return "Yes" when the client is in communication. Intended to be used as a heart beat

* SetVal:ControlName,Value - Set the value of a control with the given ControlName to the given Value

### Not Implemented

* GetAllControlValues: - Will return a series of tuples (ControlValueName,ControlValue) to indicate all current control values on the client

