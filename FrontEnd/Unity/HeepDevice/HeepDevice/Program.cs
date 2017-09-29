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

			int foundNum = HeepLanguage.GetNumberFromBuffer (buffer, 0, 2);
			Console.Write ("Found Num: ");
			Console.WriteLine (foundNum);

		}

		public static void Main (string[] args)
		{
			Console.WriteLine (HeepLanguage.AddMOPOpCode);

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
			HeepCommunications.StartHeepServer (myDevice);

			byte value = 0;
			while (true) {
				Console.WriteLine ("helr");

//				byte [] IPAddrArraya = {192, 168, 0, 37};
//				IPAddress theAddra = new IPAddress(IPAddrArraya);
//				List<byte> newBuf = new List<byte>();
//				newBuf.Add (0x0A);
//				newBuf.Add (0x02);
//				newBuf.Add (0x00);
//				newBuf.Add (value);
//				HeepCommunications.SendBufferToIP (newBuf, theAddra);
//
//				if (value == 0) {
//					value = 1;
//				}
//				else{
//					value = 0;
//				}

				Thread.Sleep (1000);
			}
		}
			
	}
}
