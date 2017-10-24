using System.Linq;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GroupsSceneController : MonoBehaviour {

	public GameObject groupPrefab;

	private List<Group> groups = new List<Group>();
	private List<Group> groupsInThisPlace = new List<Group> ();

	void Update() {

		CheckForNew ();
	}

	void CheckForNew() {
		if (GlobalData.store.groups.Count > groups.Count) {
			groups = new List<Group>(GlobalData.store.groups);
			Debug.Log (GlobalData.store.activePlace);

			if (GlobalData.store.activePlace != "null") {
				groupsInThisPlace = groups.Where (thisGroup => thisGroup.placeID == GlobalData.store.activePlace).ToList();

				Debug.Log ("I want to generate " + groupsInThisPlace.Count + " groups");


			} else {
				
				Debug.Log ("instantiating all groups");
				groupsInThisPlace = groups;

			}

			InstantiateGroups ();
		}
	}

	void InstantiateGroups() {
		float position = 0f - (4 * (groupsInThisPlace.Count - 1))/2;

		foreach (Group group in groupsInThisPlace) {
			GameObject.Destroy (GameObject.Find (group.groupID));

			var newGroupObject = Instantiate (groupPrefab);
			newGroupObject.GetComponent<GroupPrefabController> ().loadData(group);
			newGroupObject.transform.position = new Vector3 (position, 0, 0);

			position += 4f;
		}
	}

}