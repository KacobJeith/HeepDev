using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class DoubleClickEnterScene : MonoBehaviour, IPointerDownHandler {

	public string nextSceneName;
	public int numClicks = 0;

	float clickOnetime = 0;
	float doubleClickDelay = 0.4f;



	#region IPointerDownHandler implementation
	public void OnPointerDown (PointerEventData eventData)
	{
		numClicks++;

		if ((Time.time - clickOnetime) > doubleClickDelay) {
			clickOnetime = Time.time;
			numClicks = 1;
		}

		if (numClicks > 1 && (Time.time - clickOnetime) < doubleClickDelay) {
			numClicks = 0;
			SceneManager.LoadScene (nextSceneName);
		}
	}
	#endregion
}
