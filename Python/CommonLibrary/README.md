# Python Common Libraries

## ActionOpCodeParser.py

Parses the opcodes that other devices and front ends use to control devices. Each of these OpCodes responds with a "Response Op Code" that is also implemented in this file.

## CommonDataTypes.py

This includes data types that will be used regularly in other python files. Current Data Types:
* HeepIPAddress - IP Address object that helps Heep libraries speak a common language

## ControlValue.py

Implements the controls that a devices uses to communicate over.

## Device.py

The collection of all of the information that a Device needs. This includes Vertices, Controls, and Output Lists. This also contains algorithms for generating the serialized device data strings.

## DeviceMemory.py

Implements the miscellaneous device memory.

## MemoryUtilities.py

These are utilities that are useful in creating the codes that are stored in miscellaneous and core memory.

## OpCodeUtilities.py

Basic OpCode utilities that are not memory or action specific. Helper functions to assist in bitwise and byte-wise operations.

## OutputData.py

The object that contains the information that ultimately indicates the final destination of a piece of information. This data is usually stored in a list and queued for output in the device when the device must send an output.

## SendOpCodesToDevice.py

A simple script that sends byte data to a specific IP Address

## ServerlessDevice.py

This defines the network functionality of the serverless devices. 

## ServerlessDeviceTest.py

This creates a serverless device packed full of information that can be communicated with via the frontend or other test code.

## TestCommonLibrary.py

These are the unit tests that make sure that changes to the other common library files haven't destroyed anything.

## Vertex.py

Defines the vertex object.

