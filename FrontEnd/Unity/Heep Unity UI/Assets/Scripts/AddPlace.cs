using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class AddPlace : MonoBehaviour, IPointerDownHandler {

	public GameObject prefab;
	public GameObject canvas;
	public GameObject GlobalStore;

	#region IPointerDownHandler implementation

	public void OnPointerDown (PointerEventData eventData)
	{
		Debug.Log ("Mouse detected");
		GlobalDataStore GData = GlobalStore.GetComponent<GlobalDataStore> ();

		GameObject enemy = Instantiate(prefab, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
		enemy.transform.SetParent (canvas.transform, false);
		PlaceData myPlace = enemy.GetComponent<PlaceData> ();
		GData.AddPlaceToList (myPlace);
	}

	#endregion
}