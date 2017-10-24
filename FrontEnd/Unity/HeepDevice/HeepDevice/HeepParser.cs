using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;  

namespace Heep
{
	public static class HeepParser
	{
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
			}
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
			int numBytes = HeepLanguage.GetNumberFromBuffer (commandBuffer, counter, 1);
			counter++;
			DeviceID txID = HeepLanguage.GetDeviceIDFromBuffer (commandBuffer, counter);
			counter += txID.GetDeviceIDSize ();
			DeviceID rxID = HeepLanguage.GetDeviceIDFromBuffer (commandBuffer, counter);
			counter += rxID.GetDeviceIDSize ();
			int txControl = HeepLanguage.GetNumberFromBuffer (commandBuffer, counter, 1);
			counter++;
			int rxControl = HeepLanguage.GetNumberFromBuffer (commandBuffer, counter, 1);
			counter++;
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
}

