using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using Firebase;
using Firebase.Database;
using Firebase.Auth;
using Firebase.Unity.Editor;

public class ObserveProfileData : MonoBehaviour, IPointerDownHandler {

	void Start() {
		// Set this before calling into the realtime database.
		FirebaseApp.DefaultInstance.SetEditorDatabaseUrl("https://heep-3cddb.firebaseio.com/");
		FirebaseApp.DefaultInstance.SetEditorP12FileName("Heep-5b95f8c5bdc9.p12");
		FirebaseApp.DefaultInstance.SetEditorServiceAccountEmail("unity-admin@heep-3cddb.iam.gserviceaccount.com");
		FirebaseApp.DefaultInstance.SetEditorP12Password("notasecret");
		Debug.Log ("Tried to setup P12");
	}

	public GameObject prefab;
	public GameObject canvas;

	#region IPointerDownHandler implementation

	public void OnPointerDown (PointerEventData eventData)
	{
		// Get the root reference location of the database.
		DatabaseReference reference = FirebaseDatabase.DefaultInstance.RootReference;
		Firebase.Auth.FirebaseAuth auth = Firebase.Auth.FirebaseAuth.DefaultInstance;
		Firebase.Auth.FirebaseUser user = auth.CurrentUser;
		Debug.Log ("Trying to read");

		if (user != null) {
			string name = user.DisplayName;
			string email = user.Email;
			string uid = user.UserId;
			Debug.Log ("Email: " + email);
			Debug.Log ("UID: " + uid);
			Debug.Log (user.ToString());
			writeNewUser (uid, name, email);



			user.TokenAsync(true).ContinueWith(task => {
				if (task.IsCanceled) {
					Debug.LogError("TokenAsync was canceled.");
					return;
				}

				if (task.IsFaulted) {
					Debug.LogError("TokenAsync encountered an error: " + task.Exception);
					return;
				}

				string idToken = task.Result;

				Debug.Log("Read token: " + idToken);

				FirebaseDatabase.DefaultInstance
					.GetReference ("userDirectory")
					.GetValueAsync ().ContinueWith (taskRead => {
						if (taskRead.IsFaulted) {
							// Handle the error...
							Debug.Log("Ran into some error...");

						} else if (taskRead.IsCompleted) {
							DataSnapshot snapshot = taskRead.Result;
							// Do something with snapshot...
							Debug.Log ("Successfully read path");
							Debug.Log (snapshot.GetRawJsonValue());
						}
					});
			});


		} else {
			Debug.Log ("No User is logged in");
		}

	}

	#endregion

	private void writeNewUser(string userId, string name, string email) {
		Debug.Log ("Trying To write user");

		DatabaseReference reference = FirebaseDatabase.DefaultInstance.RootReference;

		User user = new User(name, email);
		string json = JsonUtility.ToJson(user);

		reference.Child("unity").SetRawJsonValueAsync(json);
	}


}

public class User {
	public string username;
	public string email;

	public User() {
	}

	public User(string username, string email) {
		this.username = username;
		this.email = email;
	}
}
