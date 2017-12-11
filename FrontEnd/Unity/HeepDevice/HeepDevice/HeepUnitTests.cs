using System;
using System.Collections;
using System.Collections.Generic;

namespace Heep
{
	public class TestData
	{
		string _testName;

		object _data1;
		object _data2;

		public TestData(String testName,object data1,object data2)
		{
			_data1 = data1;
			_data2 = data2;
			_testName = testName;
		}

		public bool CheckEquality()
		{
			return EqualityComparer<object>.Default.Equals (_data1, _data2);
		}

		public string GetTestFailedString()
		{
			string failedString = "\t" + _testName + " Failed!!\n\t\t" + _data1 + " != " + _data2;
			return failedString;
		}
	}

	public class HeepTest
	{
		List<TestData> testList;
		string _testName;

		public HeepTest(String testName)
		{
			testList = new List<TestData> ();
			_testName = testName;
		}

		public void AddTest(TestData newData)
		{
			testList.Add (newData);
		}

		public void CheckTests()
		{
			bool reportedTestsFailed = false;

			for (int i = 0; i < testList.Count; i++) {
				if (testList [i].CheckEquality ()) {
				} else {
					if (!reportedTestsFailed) {
						reportedTestsFailed = true;	
						Console.WriteLine (_testName + " Failed!");
					}
					Console.WriteLine( testList [i].GetTestFailedString () );
				}
			}

			if (!reportedTestsFailed) {
				Console.WriteLine (_testName + " Passed!!!");
			}
		}
	}

	public static class HeepUnitTests
	{
		public static void TestNameParse()
		{

		}

		public static void TestNonVolatileMemory()
		{
			HeepTest nonVolatileTest = new HeepTest ("Non Volatile Memory Test");

			String TestDeviceName = "Test Device";

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
			String foundName = HeepParser.parseDeviceNameMOP (readMem, ref counter);

			nonVolatileTest.AddTest (new TestData ("Device Name", TestDeviceName, foundName));

			nonVolatileTest.CheckTests ();
		}
	}
}