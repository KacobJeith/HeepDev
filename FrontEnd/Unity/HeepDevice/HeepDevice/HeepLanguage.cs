using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;  

namespace Heep
{
	public class HeepLanguage
	{
		// OpCodes
		public const byte ClientDataOpCode 		 	= 0x01;
		public const byte ControlOpCode 			= 0x02;
		public const byte VertexOpCode 			 	= 0x03;
		public const byte IconIDOpCode 			 	= 0x04;
		public const byte CustomIconDrawingOpCode 	= 0x05;
		public const byte DeviceNameOpCode 		 	= 0x06;
		public const byte FrontEndPositionOpCode	= 0x07;
		public const byte DeviceIPOpCode 			= 0x08;
													  
		public const byte IsHeepDeviceOpCode 		= 0x09;
		public const byte SetValueOpCode 			= 0x0A;
		public const byte SetPositionOpCode 		= 0x0B;
		public const byte SetVertexOpCode 		 	= 0x0C;
		public const byte DeleteVertexOpCode 		= 0x0D;
		public const byte EchoOpCode 				= 0x0E;
													  
		public const byte MemoryDumpOpCode 			= 0x0F;
		public const byte SuccessOpCode 			= 0x10;
		public const byte ErrorOpCode 				= 0x11;
													  
		public const byte FragmentOpCode 			= 0x12;
													  
		public const byte AddMOPOpCode 				= 0x13;
		public const byte DynamicMemorySizeOpCode 	= 0x14;
		public const byte DeleteMOPOpCode 			= 0x15;
		public const byte LocalDeviceIDOpCode 		= 0x16;

		public HeepLanguage ()
		{
		}

		public static void AddDeviceIDToMemory(List <byte> dynMem, DeviceID deviceID)
		{ 
			for (int i = 0; i < deviceID.GetDeviceIDSize (); i++) {
				dynMem.Add (deviceID.GetIDArray () [i]);
			}
		}

		public static void AddNameToMemory(List <byte> dynMem, DeviceID deviceID, String deviceName)
		{
			dynMem.Add (DeviceNameOpCode);
			AddDeviceIDToMemory (dynMem, deviceID);

			dynMem.Add ((byte)deviceName.Length);
			for (int i = 0; i < deviceName.Length; i++) {
				dynMem.Add ((byte)deviceName [i]);
			}
		}

		public static void AddVertexToMemory(List <byte> dynMem, Vertex theVertex)
		{
			int totalMemory = theVertex.GetTXID().GetDeviceIDSize () + 6;
			dynMem.Add (VertexOpCode);
			AddDeviceIDToMemory (dynMem, theVertex.GetTXID ());
			dynMem.Add ((byte)totalMemory);
			AddDeviceIDToMemory (dynMem, theVertex.GetRXID ());
			dynMem.Add ((byte)theVertex.GetTXControlID ());
			dynMem.Add ((byte)theVertex.GetRXControlID ());

			for (int i = 0; i < theVertex.GetDestIP ().GetAddressBytes ().Length; i++) {
				dynMem.Add (theVertex.GetDestIP ().GetAddressBytes () [i]);
			}
		}

		public static void AddControlDataToBuffer(List <byte> buffer, List <Control> controlList, DeviceID deviceID)
		{
			for (int i = 0; i < controlList.Count; i++) {
				buffer.Add (ControlOpCode);
				AddDeviceIDToMemory (buffer, deviceID);
				int dataSize = controlList [i].GetName ().Length + 6;
				byte numBytes = (byte)dataSize;
				buffer.Add (numBytes);
				buffer.Add ((byte)controlList [i].GetID ());
				buffer.Add ((byte)controlList [i].GetControlType ());
				buffer.Add ((byte)controlList [i].GetControlDirection ());
				buffer.Add ((byte)controlList [i].GetLowValue ());
				buffer.Add ((byte)controlList [i].GetHighValue ());
				buffer.Add ((byte)controlList [i].GetCurValue ());

				for (int j = 0; j < controlList [i].GetName ().Length; j++) {
					buffer.Add ((byte)controlList [i].GetName () [j]);
				}
			}
		}

		public static void AddCoreMemoryToBuffer(List <byte> buffer, DeviceID deviceID, int firmwareVersion, List <Control> controlList, int dynamicMemorySize)
		{
			// Client Data
			buffer.Add (ClientDataOpCode);
			AddDeviceIDToMemory (buffer, deviceID);
			buffer.Add (0x01); // Num Bytes
			buffer.Add((byte)firmwareVersion);

			// Control Data
			AddControlDataToBuffer(buffer, controlList, deviceID);

			// Dynamic memory size
			buffer.Add(DynamicMemorySizeOpCode);
			AddDeviceIDToMemory (buffer, deviceID);
			buffer.Add (0x01);
			buffer.Add ((byte)dynamicMemorySize);
		}

		public static void AddBufferToBuffer(List <byte> buffer, List <byte> bufferToAdd)
		{
			for (int i = 0; i < bufferToAdd.Count; i++) {
				buffer.Add (bufferToAdd [i]);
			}
		}

		public static void GetMemoryDump(List <byte> buffer, DeviceID deviceID, int firmwareVersion, List <Control> controlList, List <byte> dynMem, int dynMemSize)
		{
			List <byte> coreMemoryBuffer = new List<Byte> ();

			AddCoreMemoryToBuffer (coreMemoryBuffer, deviceID, firmwareVersion, controlList, dynMemSize);

			int totalMemory = coreMemoryBuffer.Count + dynMem.Count;

			buffer.Add (MemoryDumpOpCode);
			AddDeviceIDToMemory (buffer, deviceID);
			buffer.Add ((byte)totalMemory);

			AddBufferToBuffer (buffer, coreMemoryBuffer);
			AddBufferToBuffer (buffer, dynMem);

		}

		public static List<byte> GetSetValCOPBuffer(int controlID, int value)
		{
			List <byte> setValBuffer = new List<byte> ();

			setValBuffer.Add (HeepLanguage.SetValueOpCode);
			setValBuffer.Add ((byte)0x02);
			setValBuffer.Add ((byte)controlID);
			setValBuffer.Add ((byte)value);

			return setValBuffer;
		}

		public static List<byte> AddNumberToBufferWithSpecifiedBytes(List <byte> buffer, int number, int numBytes)
		{
			for(int i = 0; i < numBytes; i++)
			{
				int numToAdd = (number >> 8*( (numBytes-1) - i))%256;
				buffer.Add ((byte)numToAdd);
			}

			return buffer;
		}

		public static int GetNumberFromBuffer(List <byte> buffer, ref int position, int length)
		{
			int number = 0;

			for(int i = 0; i < length; i++)
			{
				int curNum = buffer[position + i];

				number += curNum << (8 * (length-i-1));

			}

			position += length;

			return number;
		}

		public static DeviceID GetDeviceIDFromBuffer(List<byte> buffer, int position)
		{
			List <byte> deviceBytes = new List<byte> ();

			int numBytesInID = 4; // This will be read dynamically once we have dynamic iDs

			for (int i = position; i < position + numBytesInID; i++) {
				deviceBytes.Add (buffer [i]);
			}

			DeviceID retID = new DeviceID (deviceBytes);
			return retID;
		}

		public static IPAddress GetIPAddrFromBuffer(List <byte> buffer, int position)
		{
			List<byte> IPBytes = new List<byte> ();

			for (int i = position; i < position + 4; i++) {
				IPBytes.Add (buffer [i]);
			}

			IPAddress theIP = new IPAddress (IPBytes.ToArray());

			return theIP;
		}
	}
}

