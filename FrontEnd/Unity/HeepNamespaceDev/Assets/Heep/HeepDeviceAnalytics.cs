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
		byte controlID;
		byte controlValue;

		public HeepDeviceAnalytics(int _controlID, int _controlValue)
		{
			startTime = new DateTime (2017, 12, 20, 0, 0, 0);
			curTime = DateTime.Now;
			controlID = (byte)_controlID;
			controlValue = (byte)_controlValue;
			Debug.Log ("Analytic Data Created at " + curTime + " for CtrlID " + controlID + " with Value " + controlValue);
		}

		public List <byte> GetBytes(DeviceID theID)
		{
			List <byte> byteArray = new List<byte> ();

			byteArray.Add (HeepLanguage.AnalyticsData);
			HeepLanguage.AddDeviceIDToMemory (byteArray, theID);

			double milliSeconds = ((curTime - startTime).TotalSeconds)*1000;
			ulong fixedPointMilliSeconds = (ulong)milliSeconds;
			Debug.Log ("Milliseconds from " + startTime + " to now is " + fixedPointMilliSeconds);

			int numBytesForTime = HeepLanguage.GetNumBytesRequiredForULong (fixedPointMilliSeconds);
			List <byte> milliSecondByteArray = HeepLanguage.GetByteArrayFromULong (fixedPointMilliSeconds);

			byte numBytes = (byte)(numBytesForTime + 5);

			byteArray.Add (numBytes);
			byteArray.Add (controlID);
			byteArray.Add (1); // Only support 1 byte control values with this right now
			byteArray.Add(controlValue);
			byteArray.Add (1); // Unity is only running on absolute time for the moment
			byteArray.Add ((byte)numBytesForTime);

			for (int i = 0; i < numBytesForTime; i++) {
				byteArray.Add (milliSecondByteArray [numBytesForTime - i - 1]);
			}

			string printableString = "";
			for (int i = 0; i < byteArray.Count; i++) {
				printableString += byteArray [i];
				printableString += " ";
			}

			Debug.Log (printableString);

			return byteArray;
		}
	}
}
