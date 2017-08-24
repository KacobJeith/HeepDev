using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class ButtonToScene : MonoBehaviour, IPointerDownHandler {

	public string nextSceneName;

	#region IPointerDownHandler implementation
	public void OnPointerDown (PointerEventData eventData)
	{
		SceneManager.LoadScene (nextSceneName);
	}
	#endregion
}
