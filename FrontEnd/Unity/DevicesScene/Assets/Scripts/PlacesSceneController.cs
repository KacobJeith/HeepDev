using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlacesSceneController : MonoBehaviour {

	public GameObject placePrefab;
	private List<Place> places = new List<Place>();

	void Update() {

		CheckForNewPlaces ();
	}

	void CheckForNewPlaces() {
		if (GlobalData.store.places.Count > places.Count) {
			places = new List<Place>(GlobalData.store.places);
			Debug.Log ("I want to generate " + places.Count + " places");
			InstantiatePlaces ();
		}
	}

	void InstantiatePlaces() {
		float position = -8;

		foreach (Place place in places) {
			
			if (GameObject.Find(place.placeID) == null)
			{
				var newPlaceObject = Instantiate (placePrefab);
				newPlaceObject.GetComponent<PlacePrefabController> ().loadData(place);
				newPlaceObject.transform.position = new Vector3 (position, 0, 0);
			}

			position += 4f;
		}
	}

}