using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using System.Net;

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

	[Test]
	public static void TestParseControl()
	{
		List <byte> controlTest = new List<byte> ();
		controlTest.Add (0x02);
		controlTest.Add (0x01);
		controlTest.Add (0x02);
		controlTest.Add (0x03);
		controlTest.Add (0x04);
		controlTest.Add (0x09); // Num Bytes
		controlTest.Add (0xEA); // Control ID
		controlTest.Add ((byte)Control.CtrlType.range); // Control Type
		controlTest.Add ((byte)Control.CtrlInputOutput.output); // Control Direction
		controlTest.Add (0x02); // Low Value
		controlTest.Add (0x10); // High Value
		controlTest.Add (0x06); // Current Value
		controlTest.Add ((byte)'F'); // Name
		controlTest.Add ((byte)'u'); // Name
		controlTest.Add ((byte)'n'); // Name

		int counter = 1;
		Control newControl = HeepParser.parseControlMOP (controlTest, ref counter);

		Assert.AreEqual ("Fun", newControl.GetName ());
		Assert.AreEqual (0x02, newControl.GetLowValue ());
		Assert.AreEqual (0x10, newControl.GetHighValue ());
		Assert.AreEqual (0x06, newControl.GetCurValue ());
		Assert.AreEqual (Control.CtrlType.range, newControl.GetControlType ());
		Assert.AreEqual (Control.CtrlInputOutput.output, newControl.GetControlDirection ());
		Assert.AreEqual (0xEA, newControl.GetID ());
	}

	[Test]
	public static void TestParseVertex()
	{
		List <byte> rxIDArray = new List<byte> ();
		for (int i = 0; i < DeviceID.GetDefaultIDSize (); i++) {
			rxIDArray.Add ((byte)i);
		}
		DeviceID rxID = new DeviceID (rxIDArray);

		List <byte> txIDArray = new List<byte> ();
		for (int i = 0; i < DeviceID.GetDefaultIDSize (); i++) {
			txIDArray.Add ((byte)i);
		}
		DeviceID txID = new DeviceID (txIDArray);

		byte [] IPArray = {192, 168, 1, 102};
		IPAddress rxAddr = new IPAddress (IPArray);

		List <byte> vertexTest = new List<byte> ();
		vertexTest.Add (HeepLanguage.VertexOpCode);
		HeepLanguage.AddDeviceIDToMemory (vertexTest, txID);
		vertexTest.Add (0x0A);
		HeepLanguage.AddDeviceIDToMemory (vertexTest, rxID);
		vertexTest.Add (0x0F); // Control ID TX
		vertexTest.Add (0xa2); // Control ID RX
		HeepLanguage.AddIPAddressToBuffer (vertexTest, rxAddr);

		int counter = 1;
		Vertex parsedVertex = HeepParser.parseVertexMOP (vertexTest, ref counter);

		Assert.AreEqual (rxAddr, parsedVertex.GetDestIP ());

	}

}
