using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;

namespace Heep
{
	public class HeepDevice
	{
		private const int FirmwareVersion = 1;


		private List<Vertex> vertices = new List<Vertex>(); 
		private List<Control> controls = new List<Control>();

		private DeviceID myID = new DeviceID();

		public HeepDevice (DeviceID theID)
		{
			SetDeviceID (theID);
		}

		public DeviceID GetDeviceID()
		{
			return myID;
		}

		public void SetDeviceID(DeviceID newID)
		{
			myID = newID;
		}
	}

	public class DeviceID
	{
		int [] theID;
		private const int DeviceIDSize = 4;

		public DeviceID()
		{
		}

		public int[] GetIDArray()
		{
			return theID;
		}

		public void SetIDArray(int [] newID)
		{
			theID = newID;
		}

		public int GetDeviceIDSize()
		{
			return DeviceIDSize;
		}
	}

	class Vertex
	{

		DeviceID _rxID;
		DeviceID _txID;

		int _rxControlID;
		int _txControlID;
		IPAddress _destIP;

		public Vertex(DeviceID rxID, DeviceID txId, int rxControlID, int txControlID, IPAddress destIP)
		{
			_rxID = rxID;
			_txID = txId;
			_rxControlID = rxControlID;
			_txControlID = txControlID;
			_destIP = destIP;
		}
	}

	class Control
	{
		int _controlID;
		int _controlDirection;
		int _controlType;
		int _highValue;
		int _lowValue;
		int _curValue;
		int _controlFlags;
		String _controlName;

		public Control(int controlID, int controlDirection, int controlType, int highValue, int lowValue, int curValue, int controlFlags, String ControlName)
		{
			_controlID = controlID;
			_controlDirection = controlDirection;
			_controlType = controlType;
			_highValue = highValue;
			_lowValue = lowValue;
			_curValue = curValue;
			_controlFlags = controlFlags;
			_controlName = ControlName;
		}
	}
}

