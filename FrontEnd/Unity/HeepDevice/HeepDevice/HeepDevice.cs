using System;
using System.Collections;
using System.Collections.Generic;

namespace Heep
{
	public class HeepDevice
	{
		private const int FirmwareVersion = 1;
		private const int DeviceIDSize = 4;

		private List<Vertex> vertices = new List<Vertex>(); 
		private List<Control> controls = new List<Control>();

		private DeviceID myID = new DeviceID(DeviceIDSize);

		public HeepDevice ()
		{
			
		}
	}

	class DeviceID
	{
		int [] theID;
		public DeviceID(int numBytes)
		{
			theID = new int[numBytes];
		}
	}

	class Vertex
	{
		public Vertex()
		{

		}
	}

	class Control
	{
		public Control()
		{

		}
	}
}

