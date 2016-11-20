#!/bin/bash

cd Client/
make
cd ../ControlValue/
make
cd ../Vertex/
make

cd ../
Client/ClientTest.app
ControlValue/ControlTest.app
Vertex/VertexTest.app
