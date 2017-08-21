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
			DeviceID theID = new DeviceID ();
			Console.WriteLine (HeepLanguage.AddMOPOpCode);
			HeepLanguage language = new HeepLanguage ();
			HeepDevice myDevice = new HeepDevice (theID);
			Console.WriteLine ("Hello World!");

			byte[] ID = { 1, 2, 3, 4 };
			DeviceID myID = new DeviceID();
			myID.SetIDArray (ID);
			List <byte> myMem = new List<Byte> ();
			Console.WriteLine (myMem.Count);
			HeepLanguage.AddNameToMemory (myMem, myID, "Twilio");
			Console.WriteLine (myMem.Count);
			for (int i = 0; i < myMem.Count; i++) {
				Console.Write (myMem [i] + " ");
			}
			Console.WriteLine ();
		}
			
	}
}
