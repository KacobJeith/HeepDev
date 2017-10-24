using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DevicePrefabController : MonoBehaviour {

	private DeviceControl control;

	public void loadData(DeviceControl control) {

		gameObject.name = control.uniqueID;

		Text namefield = gameObject.GetComponentsInChildren<Text> ()[0] as Text;
		namefield.text = control.controlName;

	}

}
