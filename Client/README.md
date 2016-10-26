# PLC Client API

This documents describes the client API functions for the PLC clients. These commands will be used by the server and other clients to request information from the clients.

## Current State

Currently, the clients have no way to reach out to each other. They are just reaching out to the server. This piece still must be implemented.

## Command List

### Implemented

None

### Not Implemented

* IsAlive: - Will return "Yes" when the client is in communication. Intended to be used as a heart beat

* SetVal:(ControlName,Value) - Set the value of a control with the given ControlName to the given Value

* GetAllControlValues: - Will return a series of tuples (ControlValueName,ControlValue) to indicate all current control values on the client

