using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class CreatePlacesRoomFromData : MonoBehaviour {

	public GameObject prefab;
	public GameObject canvas;

	// Use this for initialization
	void Start () {

		for (int i = 0; i < GlobalDataStore.places.Count; i++) {
			//GameObject newPlace = Instantiate(prefab, GlobalDataStore.places[i].PlaceLocation, Quaternion.identity) as GameObject;
			GameObject newPlace = Instantiate(prefab, new Vector3(GlobalDataStore.places[i].PlaceLocation.x, GlobalDataStore.places[i].PlaceLocation.y, 0), Quaternion.identity) as GameObject;
			newPlace.transform.SetParent (canvas.transform, false);
		}
	}
}
	