using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GroupPrefabController : MonoBehaviour {

	private Group group;

	public void loadData(Group group) {
		
		gameObject.name = group.groupID;

		Text namefield = gameObject.GetComponentsInChildren<Text> ()[0] as Text;
		namefield.text = group.name;

	}

	void OnMouseOver() {
		gameObject.GetComponentInChildren<RotateObject> ().setRotateState (true);
	}

	void OnMouseExit() {
		gameObject.GetComponentInChildren<RotateObject> ().setRotateState (false);
	}
}
