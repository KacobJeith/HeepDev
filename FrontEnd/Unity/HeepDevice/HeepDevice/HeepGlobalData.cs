using System;
using System.Collections;
using System.Collections.Generic;

namespace Heep
{

	public class HeepGlobalData {

		public static HeepGlobalData store;

		public List<Place> places = new List<Place>();
		public List<Group> groups = new List<Group>();
		public List<HeepDevice> devices = new List<HeepDevice>();
		public List<UnityControl> controls = new List<UnityControl> ();

		public string activePlace = "null";
		public string activeGroup = "null";
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

	public class UnityControl : Control {

		public string groupID;
		public string deviceID;

		public UnityControl(int controlID, CtrlInputOutput controlDirection, CtrlType controlType, int highValue, int lowValue, int curValue, String ControlName) 
			: base(controlID, controlDirection, controlType, highValue, lowValue, curValue, ControlName) 
		{
			
		}

	}
}

