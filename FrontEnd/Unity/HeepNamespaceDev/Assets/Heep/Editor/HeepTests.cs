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

	[Test]
	public static void TestParseName()
	{
		string deviceName = "Unity";

		List <byte> nameTest = new List<byte> ();
		nameTest.Add (0x06);
		nameTest.Add (0x01);
		nameTest.Add (0x02);
		nameTest.Add (0x03);
		nameTest.Add (0x04);
		nameTest.Add (0x05);

		for(int i = 0; i < deviceName.Length; i++)
		{
			nameTest.Add ((byte)deviceName [i]);
		}
	
		int counter = 1;

		string foundName = HeepParser.parseDeviceNameMOP (nameTest, ref counter);

		Assert.AreEqual (deviceName, foundName);
		Assert.AreEqual (11, counter);
	}

}
