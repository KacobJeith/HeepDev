using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlaceCallback : MonoBehaviour {

	int _placeID;

	public void SetPlaceID (int placeID){
		_placeID = placeID;
	}

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		GlobalDataStore.places [_placeID].SetPosition(GetComponent<RectTransform> ().anchoredPosition);
	}
}
