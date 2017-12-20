using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Heep
{
	public class HeepDeviceAnalytics
	{
		DateTime startTime;
		DateTime curTime;

		public HeepDeviceAnalytics(int controlID, int controlValue)
		{
			startTime = new DateTime (2017, 12, 20, 0, 0, 0);
			curTime = DateTime.Now;
			Debug.Log ("Analytic Data Created at " + curTime + " for CtrlID " + controlID + " with Value " + controlValue);
		}

		public List <byte> GetBytes(DeviceID theID)
		{
			List <byte> byteArray = new List<byte> ();

			byteArray.Add (HeepLanguage.AnalyticsData);
			HeepLanguage.AddDeviceIDToMemory (byteArray, theID);

			double seconds = (curTime - startTime).TotalSeconds;
			long fixedPointSeconds = (long)seconds;
			Debug.Log ("Seconds from " + startTime + " to now is " + fixedPointSeconds);

			return byteArray;
		}
	}
}
