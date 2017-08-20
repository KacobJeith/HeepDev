using System;
using Heep;

namespace MainProgram
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			DeviceID theID = new DeviceID ();
			HeepDevice myDevice = new HeepDevice (theID);
			Console.WriteLine ("Hello World!");
		}
			
	}
}
