using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class NumPlacesDebugData : MonoBehaviour {

	public Text NumPlaceData;
	public GameObject GlobalStore;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		NumPlaceData.text = "NumPlaces: " + GlobalDataStore.places.Count;
	}
}
