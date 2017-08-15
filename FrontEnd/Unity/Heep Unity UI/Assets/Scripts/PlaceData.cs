using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlaceData : MonoBehaviour {

	public Vector2 PlaceLocation;

	// Use this for initialization
	void Start () {
		LoadPlaceLocation ();
	}
	
	// Update is called once per frame
	void Update () {
		LoadPlaceLocation ();
	}

	void LoadPlaceLocation(){
		PlaceLocation = GetComponent<RectTransform> ().anchoredPosition;
	}
}
