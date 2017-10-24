using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlacePrefabController : MonoBehaviour {

	private Place place;

	public void loadData(Place place) {
		
		gameObject.name = place.placeID;

		Text namefield = gameObject.GetComponentsInChildren<Text> ()[0] as Text;
		namefield.text = place.name;

	}

	void OnMouseOver() {
		gameObject.GetComponentInChildren<RotateObject> ().setRotateState (true);
	}

	void OnMouseExit() {
		gameObject.GetComponentInChildren<RotateObject> ().setRotateState (false);
	}
}
