using System;


using System.Collections;
using System.Collections.Generic;
using Heep;
using System.Net;
using System.Threading;

namespace MainProgram
{
	class MainClass
	{

		public static void TestGetNumberFromBuffer()
		{
			List <byte> buffer = new List <byte> ();
			int randoNum = 2120;
			buffer = HeepLanguage.AddNumberToBufferWithSpecifiedBytes (buffer, randoNum, 2);

			Console.Write ("BUFFER: ");

			for (int i = 0; i < buffer.Count; i++) {
				Console.Write (buffer[i]);
				Console.Write (" ");
			}
			Console.WriteLine ();

			int position = 0;

			int foundNum = HeepLanguage.GetNumberFromBuffer (buffer, ref position, 2);
			Console.Write ("Found Num: ");
			Console.WriteLine (foundNum);

		}

		public static void Main (string[] args)
		{
//			DeviceSearch.SearchForDevices ();
//
//			while (true) {
//				Thread.Sleep (1000);
//				Console.WriteLine ("Still running!");
//			}
//
//			Console.WriteLine (HeepLanguage.AddMOPOpCode);
//
			Console.WriteLine ("Hello World!");

			TestGetNumberFromBuffer ();

			List <byte> ID = new List<byte>();
			for(byte i = 0; i < 4; i++)
			{
				ID.Add(i);
			}

			DeviceID myID = new DeviceID(ID);
			HeepDevice myDevice = new HeepDevice (myID);
			List <byte> myMem = new List<Byte> ();
			Console.WriteLine (myMem.Count);
			HeepLanguage.AddNameToMemory (myMem, myID, "Twilio");
			Console.WriteLine (myMem.Count);
			for (int i = 0; i < myMem.Count; i++) {
				Console.Write (myMem [i] + " ");
			}
			Console.WriteLine ();


			Control theControl = Control.CreateControl (Control.CtrlInputOutput.input, Control.CtrlType.OnOff, "Good");
			myDevice.AddControl (theControl);

			Control outputControl = Control.CreateControl (Control.CtrlInputOutput.output, Control.CtrlType.OnOff, "UnityOut");
			myDevice.AddControl (outputControl);

			List<byte> newOutput = myDevice.GetMemoryDump ();

			for (int i = 0; i < newOutput.Count; i++) {
				Console.Write (newOutput [i] + " ");
			}
			Console.WriteLine ();

			byte [] IPAddrArray = {192, 168, 1, 100};
			IPAddress theAddr = new IPAddress(IPAddrArray);
			byte [] theArr = theAddr.GetAddressBytes ();
			Console.WriteLine (theAddr.ToString ());
			for (int i = 0; i < theArr.Length; i++) {
				Console.Write (theArr [i]+".");
			}
			Console.WriteLine ();

			myDevice.SetDeviceName ("UNITY");

			//NonVolatileData.WriteMemoryToFile (myDevice.GetMemoryDump ());
			List <Byte> curMemory = NonVolatileData.ReadMemoryFromFile ();

			List <Byte> MemDump = myDevice.GetMemoryDump ();

			for (int i = 0; i < MemDump.Count; i++) {
				Console.Write (MemDump [i]);
				Console.Write (" ");
			}
			Console.WriteLine ();

			for (int i = 0; i < curMemory.Count; i++) {
				Console.Write (curMemory [i]);
				Console.Write (" ");
			}
			Console.WriteLine ();

			int counter = 1;
			Console.WriteLine(HeepParser.parseDeviceNameMOP(curMemory, ref counter));

//			HeepCommunications.StartHeepServer (myDevice);
//
//			byte value = 0;
//			while (true) {
//				Console.Write ("Enter something to send stuff: ");
//				String newRead = Console.ReadLine ();
//				Console.WriteLine (newRead);
//
//				myDevice.SetControlByID (1, value);
//
//				if (value == 0)
//					value = 1;
//				else
//					value = 0;
//
////				byte [] IPAddrArraya = {192, 168, 0, 103};
////				IPAddress theAddra = new IPAddress(IPAddrArraya);
////				List<byte> newBuf = new List<byte>();
////				newBuf.Add (0x0A);
////				newBuf.Add (0x02);
////				newBuf.Add (0x00);
////				newBuf.Add (value);
////				HeepCommunications.SendBufferToIP (newBuf, theAddra);
////
////				if (value == 0) {
////					value = 1;
////				}
////				else{
////					value = 0;
////				}
//
//			}
		}
			
	}
}
