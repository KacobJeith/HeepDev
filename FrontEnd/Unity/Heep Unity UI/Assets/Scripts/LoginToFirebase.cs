using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using Firebase;
using Firebase.Unity.Editor;

public class LoginToFirebase : MonoBehaviour, IPointerDownHandler {

	void Start() {
		// Set this before calling into the realtime database.
		FirebaseApp.DefaultInstance.SetEditorDatabaseUrl("https://heep-3cddb.firebaseio.com/");
		FirebaseApp.DefaultInstance.SetEditorP12FileName("Heep-b111fa784a3b.p12");
		FirebaseApp.DefaultInstance.SetEditorServiceAccountEmail("unity-user@heep-3cddb.iam.gserviceaccount.com");
		FirebaseApp.DefaultInstance.SetEditorP12Password("notasecret");

		Debug.Log ("Tried to setup P12");
	}

	public GameObject prefab;
	public GameObject canvas;

	#region IPointerDownHandler implementation

	public void OnPointerDown (PointerEventData eventData)
	{
		Debug.Log ("Trying to Log On");
		Firebase.Auth.FirebaseAuth auth = Firebase.Auth.FirebaseAuth.DefaultInstance;

		auth.CreateUserWithEmailAndPasswordAsync("unity@pewnity.io", "SenorEgg").ContinueWith(task => {
			if (task.IsCanceled) {
				Debug.LogError("CreateUserWithEmailAndPasswordAsync was canceled.");
				return;
			}
			if (task.IsFaulted) {
				Debug.LogError("CreateUserWithEmailAndPasswordAsync encountered an error: " + task.Exception);
				return;
			}

			// Firebase user has been created.
			Firebase.Auth.FirebaseUser newUser = task.Result;
			Debug.LogFormat("Firebase user created successfully: {0} ({1})",
				newUser.DisplayName, newUser.UserId);
		});
	}

	#endregion
}
