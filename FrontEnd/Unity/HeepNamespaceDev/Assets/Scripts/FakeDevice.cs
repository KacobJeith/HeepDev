using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Heep;

public class FakeDevice : MonoBehaviour {

	HeepDevice myDevice;

	void CreateHeepDevice()
	{
		List <byte> ID = new List<byte>();
		for(byte i = 0; i < 4; i++)
		{
			ID.Add(i);
		}

		DeviceID myID = new DeviceID(ID);
		myDevice = new HeepDevice (myID);

		Control theControl = Control.CreateControl (Control.CtrlInputOutput.input, Control.CtrlType.OnOff, "First");
		myDevice.AddControl (theControl);
		Control newControl = Control.CreateControl (Control.CtrlInputOutput.input, Control.CtrlType.OnOff, "Second");
		myDevice.AddControl (newControl);
		myDevice.SetDeviceName ("Unity");
		HeepCommunications.StartHeepServer (myDevice);
	}

	// Use this for initialization
	void Start () {
		CreateHeepDevice ();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
