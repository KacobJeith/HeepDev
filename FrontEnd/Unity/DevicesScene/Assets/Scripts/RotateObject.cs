using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateObject : MonoBehaviour {

	public float speed = 30;
	public bool rotate = false;

	void Update () {

		if (rotate) {
			transform.Rotate (0, Time.deltaTime * speed, 0);
		}
	}

	public void setRotateState(bool shouldRotate) {
		rotate = shouldRotate;
	}

}
