using UnityEngine;
using System.Collections;

public class RotateCamera : MonoBehaviour
{
	public float testingSpeed = 3.5f;
	public float touchSpeed = 0.1f;

	private float X;
	private float Y;

	private float last_touch_x = 0;
	private float last_touch_y = 0;

	private bool rotating = false;

	void FixedUpdate() {
		
		if (!rotating) {
			CheckIfRotating ();
		} else {
			Rotate ();
			CheckDragEnded ();
		}
	}

	void CheckIfRotating() {

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
		if (Physics.Raycast (ray)) {
			Debug.Log ("There is something in front of the object!");

		} else {
			Debug.Log ("Nothing in Front of Object");
			rotating = true;
		}
	}

	void CheckDragEnded() {
		
		if (Input.touchCount > 0) {
			
			if (Input.GetTouch(0).phase == TouchPhase.Ended) {

				last_touch_x = 0;
				last_touch_y = 0;
				rotating = false;

			}

		} else if (Input.GetMouseButtonUp (0)) {
			Debug.Log ("Drag ended");
			rotating = false;
		}
	}

	void Rotate() {

		if (Input.touchCount > 0) {

			Touch touch = Input.GetTouch (0);

			if (touch.phase == TouchPhase.Began) {


				last_touch_x = touch.position.x;
				last_touch_y = touch.position.y;


			} else if (touch.phase == TouchPhase.Moved) {

				float pointer_y = last_touch_y - touch.position.y;
				float pointer_x = last_touch_x - touch.position.x;

				transform.Rotate (new Vector3 (pointer_y * touchSpeed, -pointer_x * touchSpeed, 0));
				X = ClampToGoodValues (transform.rotation.eulerAngles.x);
				Y = transform.rotation.eulerAngles.y;
				transform.rotation = Quaternion.Euler (X, Y, 0);

				last_touch_x = touch.position.x;
				last_touch_y = touch.position.y;

			}

		} else if (Input.GetMouseButton (0)) {

			float pointer_x = Input.GetAxis ("Mouse X");
			float pointer_y = Input.GetAxis ("Mouse Y");

			transform.Rotate (new Vector3 (pointer_y * testingSpeed, -pointer_x * testingSpeed, 0));

			X = ClampToGoodValues (transform.rotation.eulerAngles.x);
			Y = transform.rotation.eulerAngles.y;

			transform.rotation = Quaternion.Euler (X, Y, 0);


		}

	}

	float ClampToGoodValues(float val) {
		if (val > 60 && val < 90) {
			val = 60;
		} else if (val > 270 && val < 330) {
			val= 330;
		}

		return val;
	}
}

