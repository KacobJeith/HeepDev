using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlaceData {

	public GameObject placePrefab;
	public Vector2 placePosition;

	public void CreatePlaceCallback(int placeID)
	{
		placePrefab.AddComponent<PlaceCallback> ();
		placePrefab.GetComponent<PlaceCallback> ().SetPlaceID(placeID);
	}

	public void SetPosition(Vector2 position)
	{
		placePosition = position;
	}

}
