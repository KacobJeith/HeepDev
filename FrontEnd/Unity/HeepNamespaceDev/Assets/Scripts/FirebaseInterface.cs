using System;
using System.Linq;
using System.Text;  
using System.Reflection;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using Firebase;
using Firebase.Database;
using Firebase.Unity.Editor;


public class FirebaseInterface : MonoBehaviour {

	public static FirebaseInterface store;

	void Awake () {

		if (store == null) {
			DontDestroyOnLoad (gameObject);
			store = this;
		} else if (store != this) {
			Destroy (gameObject);
		}

	}

	Firebase.Auth.FirebaseAuth auth;
	Firebase.Auth.FirebaseUser user;

	private string testUser = "waxjVMMDemMCfPrKKnXKMlhRofo1";
	public bool editorTesting = false;

	public string analyticsCredential = "Heep-Analytics-ba59624ad931.p12";
	public string analyticsURL = "https://heep-analytics.firebaseio.com";
	public string analyticsServiceAccountID = "unity-user@heep-analytics.iam.gserviceaccount.com";
	private string p12Password = "notasecret";


	void Start() {
		// Set this before calling into the realtime database.
		FirebaseApp.DefaultInstance.SetEditorDatabaseUrl(analyticsURL);
		FirebaseApp.DefaultInstance.SetEditorP12FileName(Application.dataPath + "/FirebaseAssetPackage/Editor Default Resources/" + analyticsCredential);
		FirebaseApp.DefaultInstance.SetEditorServiceAccountEmail(analyticsServiceAccountID);
		FirebaseApp.DefaultInstance.SetEditorP12Password(p12Password);

		InitializeFirebase ();
		WriteHello ();

	}


	void InitializeFirebase() {
		
		auth = Firebase.Auth.FirebaseAuth.DefaultInstance;
		auth.StateChanged += AuthStateChanged;
		AuthStateChanged(this, null);
	}

	void WriteHello() {

		DatabaseReference reference = FirebaseDatabase.DefaultInstance.RootReference;

		if (editorTesting) {
			Debug.Log ("Editor Testing");
			reference.Child("users").Child(testUser).Child("username").SetValueAsync("Unity Tester");
		}

	}

	void AuthStateChanged(object sender, System.EventArgs eventArgs) {
		if (auth.CurrentUser != user) {
			
			bool signedIn = user != auth.CurrentUser && auth.CurrentUser != null;

			if (!signedIn && user != null) {
				Debug.Log("Signed out " + user.UserId);
			}
			user = auth.CurrentUser;

			if (signedIn) {
				Debug.Log("Signed in " + user.UserId);
			}
		}
	}

	public void SendDataDumpToFirebase(List <byte> dataDump) {
		DatabaseReference reference = FirebaseDatabase.DefaultInstance.RootReference;
		string dataDumpString = Encoding.ASCII.GetString (dataDump.ToArray (), 0, dataDump.Count);

		int[] bytesAsInts = dataDump.Select(x => (int)x).ToArray();
		Debug.Log("Sending Data Dump to Firebase: " + bytesAsInts);

		reference.Child("data").SetValueAsync(bytesAsInts);

	}

}


