using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GlobalData : MonoBehaviour {

	public static GlobalData store;

	public List<Place> places = new List<Place>();
	public List<Group> groups = new List<Group>();
	public List<Device> devices = new List<Device>();
	public List<DeviceControl> controls = new List<DeviceControl> ();


	public string activePlace = "null";
	public string activeGroup = "null";

	void Awake () {
		
		if (store == null) {
			DontDestroyOnLoad (gameObject);
			store = this;
		} else if (store != this) {
			Destroy (gameObject);
		}

	}

	void OnGUI() {
		GUI.Label (new Rect (10, 10, 100, 30), "NumPlaces: " + places.Count);
		GUI.Label (new Rect (10, 40, 100, 30), "NumGroups: " + groups.Count);
		GUI.Label (new Rect (10, 70, 100, 30), "NumDevices: " + devices.Count);
		GUI.Label (new Rect (10, 100, 100, 30), "NumControls: " + controls.Count);
	}
}

public class Place {

	public string name;
	public string placeID;

	public Place(string name, string placeID){}

	public Place() {
		name = "empty";
		placeID = "empty";
	}

}

public class Group {

	public string name;
	public string placeID;
	public string groupID;

	public Group(string name, string groupID, string placeID){}

	public Group() {
		name = "empty";
		placeID = "empty";
		groupID = "empty";
	}
}

public class Device {

	public string deviceID;
	public string humanAdmin;
	public string ipAddress;
	public string name;
	public string version;
	public string active;

	public Device(
		string name,
		string humanAdmin,
		string deviceID,
		string ipAddress,
		string version,
		string active){}

	public Device() {
		name = "empty";
		deviceID = "0";
		humanAdmin = "empty";
		ipAddress = "0.0.0.0";
		version = "empty";
		active = "false";
	}
}

public class DeviceControl {
	public string controlDirection;
	public string controlID;
	public string controlName;
	public string controlType;
	public string deviceID;
	public string groupID;
	public string valueCurrent;
	public long uniqueID;

	public DeviceControl(){
		controlDirection = "0";
		controlID = "0";
		controlName = "empty";
		controlType = "0";
		deviceID = "0";
		groupID = "empty";
		valueCurrent = "0";
		uniqueID = 0;
	}
}
