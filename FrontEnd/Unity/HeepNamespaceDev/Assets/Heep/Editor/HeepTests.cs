using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;

using Heep;

[TestFixture]
public class HeepTests  {

	[Test]
	public static void TestNonVolatileMemory()
	{
		string TestDeviceName = "Test Device";

		List <byte> ID = new List<byte>();
		for(byte i = 0; i < 4; i++)
		{
			ID.Add(i);
		}

		DeviceID myID = new DeviceID(ID);
		HeepDevice myDevice = new HeepDevice (myID);

		myDevice.SetDeviceName (TestDeviceName);

		List <byte> readMem = NonVolatileData.ReadMemoryFromFile ();

		int counter = 1;
		string foundName = HeepParser.parseDeviceNameMOP (readMem, ref counter);

		Assert.IsTrue (foundName == TestDeviceName);
	}

}
