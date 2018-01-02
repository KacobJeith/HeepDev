using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;  
using System.Threading;

namespace Heep
{
	public static class HeepParser
	{
		public static bool isROP(List <byte> commandBuffer)
		{
			if (commandBuffer [0] == HeepLanguage.MemoryDumpOpCode
			   || commandBuffer [0] == HeepLanguage.SuccessOpCode
			   || commandBuffer [0] == HeepLanguage.ErrorOpCode) {
				return true;
			}
			return false;
		}

		public static List<byte> ParseCommand(List <byte> commandBuffer, HeepDevice theDevice)
		{
			if (commandBuffer [0] == HeepLanguage.IsHeepDeviceOpCode) {
				return ParseIsHeepDeviceCommand (commandBuffer, theDevice);
			} else if (commandBuffer [0] == HeepLanguage.SetValueOpCode) {
				return ParseSetValueCommand (commandBuffer, theDevice);
			} else if (commandBuffer [0] == HeepLanguage.SetVertexOpCode) {
				return ParseSetVertexCommand (commandBuffer, theDevice);
			}

			return AddErrorMessageToBuffer ("Invalid Command", theDevice);
		}

		public static void ParseROP(List <byte> ROPBuffer)
		{
			if (ROPBuffer [0] == HeepLanguage.MemoryDumpOpCode) {
				Console.WriteLine ("MEMORY DUMP!!!");
				ParseMemoryDump (ROPBuffer);
			}
		}

		public static void ParseMemoryDump(List <byte> buffer)
		{
			int counter = 1;

			MOPHeader memoryDumpHeader = UnwrapMOPHeader (buffer, ref counter);
			int firmwareVersion = 0;

			String Devicename = "";
			List <Control> controlList = new List<Control>();
			List <Vertex> vertexList = new List<Vertex>();

			while (counter < buffer.Count) {
				
				byte nextMOP = buffer [counter];
				counter += 1;

				Console.WriteLine ("Next MOP: " + nextMOP);
				
				if (nextMOP == HeepLanguage.ClientDataOpCode) {
					
					firmwareVersion = parseClientDataOpCode (buffer, ref counter);
					Console.WriteLine ("Firmware Version: " + firmwareVersion);

				} else if (nextMOP == HeepLanguage.ControlOpCode) {

					Control newControl = parseControlMOP (buffer, ref counter);
					controlList.Add (newControl);

				} else if (nextMOP == HeepLanguage.VertexOpCode) {
					Vertex newVertex = parseVertexMOP (buffer, ref counter);
					vertexList.Add (newVertex);

				} else if (nextMOP == HeepLanguage.DeviceNameOpCode) {
					Devicename = parseDeviceNameMOP (buffer, ref counter);
				}
				else {
					MOPHeader header = UnwrapMOPHeader (buffer, ref counter);
					counter += header.numBytes;
				}
			
			}
		}

		public static MOPHeader UnwrapMOPHeader(List <byte> buffer, ref int counter)
		{
			DeviceID newDeviceID = HeepLanguage.GetDeviceIDFromBuffer (buffer, ref counter);

			int numBytes = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);
			MOPHeader header = new MOPHeader (numBytes, newDeviceID);

			return header;
		}

		public static void PrintDeviceID(DeviceID deviceID) {
			Console.Write ("FOUND ID: ");
			for (int i = 0; i < deviceID.GetDeviceIDSize (); i++) {
				Console.Write (deviceID.GetIDArray () [i] + " ");
			}
			Console.WriteLine ();
		}

		public static String parseDeviceNameMOP(List <byte> buffer, ref int counter)
		{
			MOPHeader header = UnwrapMOPHeader (buffer, ref counter);
			Console.WriteLine (header.numBytes);
			return HeepLanguage.GetStringFromBuffer(buffer, ref counter, header.numBytes);
		}

		public static Control parseControlMOP(List <byte> buffer, ref int counter)
		{
			MOPHeader header = UnwrapMOPHeader (buffer, ref counter);

			int controlID = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);
			int controlType = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);
			int controlDirection = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);
			int lowValue = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);
			int highValue = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);
			int curValue = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);

			string controlName = HeepLanguage.GetStringFromBuffer (buffer, ref counter, header.numBytes - 6);

			Control newControl = new Control(controlID, (Heep.Control.CtrlInputOutput) controlDirection, (Heep.Control.CtrlType) controlType, highValue, lowValue, curValue, controlName, false);
			Console.WriteLine ("Adding a control named: " + controlName);

			return newControl;
		}

		public static Vertex parseVertexMOP(List <byte> buffer, ref int counter)
		{
			MOPHeader header = UnwrapMOPHeader (buffer, ref counter);
			
			DeviceID txID = header.deviceID;
			DeviceID rxID = HeepLanguage.GetDeviceIDFromBuffer (buffer, ref counter);
			int txControlID = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);
			int rxControlID = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);
			IPAddress rxIPAddress = HeepLanguage.GetIPAddrFromBuffer (buffer, counter);
			counter += 4;

			Vertex newVertex = new Vertex (rxID, txID, rxControlID, txControlID, rxIPAddress);
			Console.WriteLine ("Adding a vertex named: " + newVertex.GetDestIP());

			return newVertex;
		}

		public static int parseClientDataOpCode(List <byte> buffer, ref int counter)
		{

			UnwrapMOPHeader (buffer, ref counter);

			int firmwareversion = HeepLanguage.GetNumberFromBuffer (buffer, ref counter, 1);

			return firmwareversion;
		}

		public static List<byte> ParseIsHeepDeviceCommand(List <byte> commandBuffer, HeepDevice theDevice)
		{
			return theDevice.GetMemoryDump ();
		}

		public static List<byte> ParseSetValueCommand(List <byte> commandBuffer, HeepDevice theDevice)
		{
			int controlID = commandBuffer [2];
			int controlValue = commandBuffer [3];
			theDevice.SetControlByID (controlID, controlValue);

			return AddSuccessMessageToBuffer ("Successfully Set Value", theDevice);
		}

		public static List<byte> ParseSetVertexCommand(List <byte> commandBuffer, HeepDevice theDevice)
		{
			int counter = 1;
			HeepLanguage.GetNumberFromBuffer (commandBuffer, ref counter, 1);
			DeviceID txID = HeepLanguage.GetDeviceIDFromBuffer (commandBuffer, ref counter);
			DeviceID rxID = HeepLanguage.GetDeviceIDFromBuffer (commandBuffer, ref counter);
			int txControl = HeepLanguage.GetNumberFromBuffer (commandBuffer, ref counter, 1);

			int rxControl = HeepLanguage.GetNumberFromBuffer (commandBuffer, ref counter, 1);

			IPAddress destIP = HeepLanguage.GetIPAddrFromBuffer (commandBuffer, counter);

			Vertex newVertex = new Vertex (rxID, txID, rxControl, txControl, destIP);

			theDevice.AddVertex (newVertex);

			return AddSuccessMessageToBuffer ("Vertex Set", theDevice);;
		}

		private static List<byte> AddSuccessMessageToBuffer(String message, HeepDevice theDevice)
		{
			List <byte> outputBuf = new List<byte>();

			outputBuf.Add (HeepLanguage.SuccessOpCode);
			HeepLanguage.AddDeviceIDToMemory (outputBuf, theDevice.GetDeviceID ());

			byte stringLength = (byte)message.Length;
			outputBuf.Add (stringLength);

			for (int i = 0; i < message.Length; i++) {
				outputBuf.Add ((byte)message [i]);
			}

			return outputBuf;
		}

		private static List<byte> AddErrorMessageToBuffer(String message, HeepDevice theDevice)
		{
			List <byte> outputBuf = new List<byte>();

			outputBuf.Add (HeepLanguage.ErrorOpCode);
			HeepLanguage.AddDeviceIDToMemory (outputBuf, theDevice.GetDeviceID ());

			byte stringLength = (byte)message.Length;
			outputBuf.Add (stringLength);

			for (int i = 0; i < message.Length; i++) {
				outputBuf.Add ((byte)message [i]);
			}

			return outputBuf;
		} 
			
	}

	public class MOPHeader {
		public int numBytes;
		public DeviceID deviceID;

		public MOPHeader(int _numBytes, DeviceID _deviceID) {
			numBytes = _numBytes;
			deviceID = _deviceID;
		}

	}
}

