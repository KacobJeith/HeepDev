using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Place
{
	
}

public class GlobalDataStore : MonoBehaviour {

	public List<Place> places = new List<Place>();

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	public void AddPlaceToList(Place newPlace)
	{
		places.Add (newPlace);
		Debug.Log ("I have this many places: " + places.Count);
	}
}
