using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class AddPlace : MonoBehaviour, IPointerDownHandler {

	public GameObject prefab;
	public GameObject canvas;
	public Button yourButton;

	#region IPointerDownHandler implementation

	public void OnPointerDown (PointerEventData eventData)
	{
		Debug.Log ("Mouse detected");

		GameObject enemy = Instantiate(prefab, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
		enemy.transform.SetParent (canvas.transform, false);
	}

	#endregion
}