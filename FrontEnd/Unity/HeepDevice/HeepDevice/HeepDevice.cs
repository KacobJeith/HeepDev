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

		private List<Byte> deviceMemory = new List<Byte> ();
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

		public void AddControl(Control newControl)
		{
			newControl.SetID (controls.Count);
			controls.Add (newControl);
		}

		public void SetControlByID(int ID, int newValue)
		{
			for (int i = 0; i < controls.Count; i++) {
				if (controls [i].GetID () == ID) {
					controls[i].SetCurValue(newValue);
				}
			}
		}
	}

	public class DeviceID
	{
		byte [] theID;
		private const int DeviceIDSize = 4;

		public DeviceID()
		{
		}

		public byte[] GetIDArray()
		{
			return theID;
		}

		public void SetIDArray(byte [] newID)
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

	public class Control
	{
		int _controlID;
		int _controlDirection;
		int _controlType;
		int _highValue;
		int _lowValue;
		int _curValue;
		String _controlName;

		public enum CtrlInputOutput : int {input = 0, output = 1}; 
		public enum CtrlType : int {OnOff = 0, range = 1};

		public Control(int controlID, CtrlInputOutput controlDirection, CtrlType controlType, int highValue, int lowValue, int curValue, String ControlName)
		{
			_controlID = controlID;
			_controlDirection = (int)controlDirection;
			_controlType = (int)controlType;
			_highValue = highValue;
			_lowValue = lowValue;
			_curValue = curValue;
			_controlName = ControlName;
		}

		public void SetID(int controlID)
		{
			_controlID = controlID;
		}

		public int GetID()
		{
			return _controlID;
		}

		public static Control CreateControl (CtrlInputOutput controlDirection, CtrlType controlType, String controlName, int highValue, int lowValue, int curValue)
		{
			return new Control (0, controlDirection, controlType, highValue, lowValue, curValue, controlName);
		}

		public static Control CreateControl(CtrlInputOutput controlDirection, CtrlType controlType, String controlName)
		{
			return CreateControl (controlDirection, controlType, controlName, 1, 0, 0);
		}

		public void SetCurValue(int value)
		{
			_curValue = value;
		}
	}
}

