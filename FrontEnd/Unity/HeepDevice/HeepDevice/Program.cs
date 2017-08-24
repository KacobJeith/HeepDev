using System;
using System.Collections;
using System.Collections.Generic;
using Heep;

namespace MainProgram
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine (HeepLanguage.AddMOPOpCode);
			HeepLanguage language = new HeepLanguage ();

			Console.WriteLine ("Hello World!");

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
		}
			
	}
}
