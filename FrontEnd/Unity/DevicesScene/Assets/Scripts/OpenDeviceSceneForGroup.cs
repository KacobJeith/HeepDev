using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class OpenDeviceSceneForGroup : MonoBehaviour {

	void OnMouseUp () {
		GlobalData.store.activeGroup = gameObject.transform.parent.parent.name;
		Debug.Log ("Opening " + gameObject.transform.parent.parent.name);

		SceneManager.LoadScene ("DevicesScene");
	}

}