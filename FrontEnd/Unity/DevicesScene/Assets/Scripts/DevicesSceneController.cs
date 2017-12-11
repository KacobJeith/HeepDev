using System.Linq;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DevicesSceneController : MonoBehaviour {

	public GameObject devicePrefab;

	private List<DeviceControl> controls = new List<DeviceControl>();
	private List<DeviceControl> controlsInThisGroup = new List<DeviceControl> ();

	void Update() {

		CheckForNew ();
	}

	void CheckForNew() {
		
		if (GlobalData.store.controls.Count > controls.Count) {
			controls = new List<DeviceControl>(GlobalData.store.controls);

			if (GlobalData.store.activeGroup != "null") {
				controlsInThisGroup = controls.Where (thisControl => thisControl.groupID == GlobalData.store.activeGroup).ToList();

				Debug.Log ("I want to generate " + controlsInThisGroup.Count + " Controls");


			} else {

				Debug.Log ("instantiating all controls");
				controlsInThisGroup = controls;

			}

			InstantiateControls ();
		}
	}

	void InstantiateControls() {
		float position = 0f - (4 * (controlsInThisGroup.Count - 1))/2;

		foreach (DeviceControl control in controlsInThisGroup) {
			GameObject.Destroy (GameObject.Find (control.uniqueID.ToString()));

			var newDeviceObject = Instantiate (devicePrefab);
			newDeviceObject.GetComponent<DevicePrefabController> ().loadData(control);
			newDeviceObject.transform.position = new Vector3 (position, 0, 0);

			position += 4f;
		}
	}

}