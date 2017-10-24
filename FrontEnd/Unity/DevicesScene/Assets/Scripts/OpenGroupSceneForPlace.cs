using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class OpenGroupSceneForPlace : MonoBehaviour {

	void OnMouseUp () {
		GlobalData.store.activePlace = gameObject.transform.parent.parent.name;
		Debug.Log ("Opening " + gameObject.transform.parent.parent.name);

		SceneManager.LoadScene ("GroupsScene");
	}

}
