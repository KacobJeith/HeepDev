﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class GlobalDataStore {

	public static List<PlaceData> places = new List<PlaceData>();
	public static string userUID = "";

	public static void AddPlaceToList(PlaceData newPlace)
	{
		places.Add (newPlace);
		Debug.Log ("I have this many places: " + places.Count);

	}

	public static void SetUserUID(string uid)
	{
		userUID = uid;
		Debug.Log ("UID: " + userUID);

	}
}
	