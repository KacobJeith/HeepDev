using UnityEngine;
using System.Collections;

public class DragSpriteAroundSphere : MonoBehaviour
{

	public float speed = 3;

	RaycastHit hit;
	private float distance = 0f;
	private bool dragging = false;

	void FixedUpdate() {

		CheckHits ();
		DragObject ();
		CheckDragEnded ();
	}

	void CheckHits() {

		if (Input.touchCount > 0) {

			if (Input.GetTouch (0).phase == TouchPhase.Began) {
				Ray ray = Camera.main.ScreenPointToRay (Input.GetTouch (0).position);

				CheckForHit (ray);
			}

		} else if (Input.GetMouseButtonDown (0)) {

			Ray ray = Camera.main.ScreenPointToRay (Input.mousePosition);

			CheckForHit (ray);
		} 

	}

	void CheckForHit(Ray ray) {
		
		if(Physics.Raycast(ray, out hit))
		{
			Debug.Log(hit.collider.gameObject.name);
			dragging = true;
			distance = hit.distance + Vector3.Distance (hit.point, hit.collider.gameObject.transform.position);
		}

	}

	void DragObject() {

		if (dragging) {

			Vector3 newPositionInput = new Vector3 ();

			if (Input.touchCount > 0) {

				Touch touch = Input.GetTouch (0);
				newPositionInput = touch.position;

			} else {

				newPositionInput = Input.mousePosition;

			}


			Ray newPositionRay = Camera.main.ScreenPointToRay (newPositionInput);
			Vector3 newPoint = newPositionRay.GetPoint (distance);
			hit.collider.gameObject.transform.position = newPoint;

		} 
	}

	void CheckDragEnded() {

		if (Input.touchCount > 0) {

			if (Input.GetTouch(0).phase == TouchPhase.Ended) {
				
				Debug.Log ("Drag ended");
				dragging = false;

			} 

		} else if (Input.GetMouseButtonUp (0)) {
			Debug.Log ("Drag ended");
			dragging = false;
		}
	}

}
