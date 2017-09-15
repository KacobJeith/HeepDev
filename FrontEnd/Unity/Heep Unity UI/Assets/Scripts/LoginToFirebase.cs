using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
//using Firebase;
//using Firebase.Unity.Editor;

public class LoginToFirebase : MonoBehaviour, IPointerDownHandler {
	

	public GameObject emailObject;
	public GameObject passwordObject;

	void Start() {
		//		// Set this before calling into the realtime database.
		//		FirebaseApp.DefaultInstance.SetEditorDatabaseUrl("https://heep-3cddb.firebaseio.com/");
		//		FirebaseApp.DefaultInstance.SetEditorP12FileName("Heep-5b95f8c5bdc9.p12");
		//		FirebaseApp.DefaultInstance.SetEditorServiceAccountEmail("unity-admin@heep-3cddb.iam.gserviceaccount.com");
		//		FirebaseApp.DefaultInstance.SetEditorP12Password("notasecret");
		//		Debug.Log ("Tried to setup P12");
		//
		//		InitializeFirebase ();

//		Database db = new Database ();
		//db.GET ("https://heep-3cddb.firebaseio/userDirectory.json");
	}


//	Firebase.Auth.FirebaseAuth auth;
//	Firebase.Auth.FirebaseUser user;

//	// Handle initialization of the necessary firebase modules:
//	void InitializeFirebase() {
//		Debug.Log("Setting up Firebase Auth");
//		auth = Firebase.Auth.FirebaseAuth.DefaultInstance;
//		auth.StateChanged += AuthStateChanged;
//		AuthStateChanged(this, null);
//	}
//
//	// Track state changes of the auth object.
//	void AuthStateChanged(object sender, System.EventArgs eventArgs) {
//		if (auth.CurrentUser != user) {
//			bool signedIn = user != auth.CurrentUser && auth.CurrentUser != null;
//			if (!signedIn && user != null) {
//				Debug.Log("Signed out " + user.UserId);
//			}
//			user = auth.CurrentUser;
//			if (signedIn) {
//				Debug.Log("Signed in " + user.UserId);
//				GlobalDataStore.SetUserUID (user);
//			}
//		}
//	}
//
//	void OnDestroy() {
//		auth.StateChanged -= AuthStateChanged;
//		auth = null;
//	}
//		

	#region IPointerDownHandler implementation

	public void OnPointerDown (PointerEventData eventData)
	{
		Debug.Log ("Trying to Log On");
		//Firebase.Auth.FirebaseAuth auth = Firebase.Auth.FirebaseAuth.DefaultInstance;

		string email = emailObject.GetComponent<InputField> ().text;
		string password = passwordObject.GetComponent<InputField> ().text;


//		auth.SignInWithEmailAndPasswordAsync(email, password).ContinueWith(task => {
//			if (task.IsCanceled) {
//				Debug.LogError("CreateUserWithEmailAndPasswordAsync was canceled.");
//				return;
//			}
//			if (task.IsFaulted) {
//				Debug.LogError("CreateUserWithEmailAndPasswordAsync encountered an error: " + task.Exception);
//				return;
//			}
//
//			// Firebase user has been created.
//			Firebase.Auth.FirebaseUser newUser = task.Result;
//			Debug.LogFormat("Firebase user logged in successfully: {0} ({1})",
//				newUser.Email, newUser.UserId);
//
//			//DisplayUserInfo(2);
//
//		});
	}

	#endregion
//
//	// Display user information.
//	void DisplayUserInfo(Firebase.Auth.IUserInfo userInfo, int indentLevel) {
//		string indent = new String(' ', indentLevel * 2);
//		var userProperties = new Dictionary<string, string> {
//			{"Display Name", userInfo.DisplayName},
//			{"Email", userInfo.Email},
//			{"Photo URL", userInfo.PhotoUrl != null ? userInfo.PhotoUrl.ToString() : null},
//			{"Provider ID", userInfo.ProviderId},
//			{"User ID", userInfo.UserId}
//		};
//		foreach (var property in userProperties) {
//			if (!String.IsNullOrEmpty(property.Value)) {
//				Debug.Log(String.Format("{0}{1}: {2}", indent, property.Key, property.Value));
//			}
//		}
//	}
}
