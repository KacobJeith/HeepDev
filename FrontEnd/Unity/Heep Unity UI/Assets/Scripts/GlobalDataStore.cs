using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GlobalDataStore : MonoBehaviour {

	public List<PlaceData> places = new List<PlaceData>();

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	public void AddPlaceToList(PlaceData newPlace)
	{
		places.Add (newPlace);
		Debug.Log ("I have this many places: " + places.Count);

	}
}
