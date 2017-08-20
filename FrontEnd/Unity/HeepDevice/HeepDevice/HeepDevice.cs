using System;
using System.Collections;
using System.Collections.Generic;

namespace Heep
{
	public class HeepDevice
	{
		private int FirmwareVersion = 1;

		private List<Vertex> vertices = new List<Vertex>(); 
		private List<Control> controls = new List<Control>();

		private DeviceID myID = new DeviceID();

		public HeepDevice ()
		{
			
		}
	}

	class DeviceID
	{
		public DeviceID()
		{

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

