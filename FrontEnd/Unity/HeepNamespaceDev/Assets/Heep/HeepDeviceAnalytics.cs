using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Heep
{
	public class HeepDeviceAnalytics
	{
		public static List <byte> GetDeviceAnalyticsByteArray (Control controlToSend, DeviceID theID)
		{
			if (controlToSend.GetType ().Equals (typeof(BufferControl))) {
				Debug.Log ("Analytic Data Created at " + DateTime.Now + " for CtrlID " + controlToSend.GetID() + " with buffer length " + ((BufferControl)controlToSend).GetBuffer ().Count);
				return GetAnalyticsByteArrayForBufferControl ((BufferControl)controlToSend, theID);
			} else {
				Debug.Log ("Analytic Data Created at " + DateTime.Now + " for CtrlID " + controlToSend.GetID() + " with Value " + controlToSend.GetCurValue());
				return GetAnalyticsByteArrayForControl (controlToSend, theID);
			}
		}

		private static List<byte> GetMillisecondsByteArray()
		{
			DateTime startTime = new DateTime (2017, 12, 20, 0, 0, 0);
			DateTime curTime = DateTime.Now;

			double milliSeconds = ((curTime - startTime).TotalSeconds)*1000;
			ulong fixedPointMilliSeconds = (ulong)milliSeconds;
			Debug.Log ("Milliseconds from " + startTime + " to now is " + fixedPointMilliSeconds);

			List <byte> milliSecondByteArray = HeepLanguage.GetByteArrayFromULong (fixedPointMilliSeconds);

			return milliSecondByteArray;
		}

		private static List<byte> GetAnalyticsByteArrayForBufferControl(BufferControl theControl, DeviceID theID)
		{
			List <byte> byteArray = new List<byte> ();

			byteArray.Add (HeepLanguage.AnalyticsData);
			HeepLanguage.AddDeviceIDToMemory (byteArray, theID);

			byte bytesToRecord = theControl.GetBuffer ().Count > 10 ? (byte)10 : (byte)theControl.GetBuffer ().Count;

			List <byte> timeArray = GetMillisecondsByteArray ();

			byte numBytes = (byte)(timeArray.Count + bytesToRecord + 4);

			byteArray.Add (numBytes);
			byteArray.Add ((byte)theControl.GetID());

			byteArray.Add (bytesToRecord); 

			for (int i = 0; i < bytesToRecord; i++) {
				byteArray.Add (theControl.GetBuffer () [i]);
			}

			byteArray.Add (1); // Unity is only running on absolute time for the moment
			byteArray.Add ((byte)timeArray.Count);

			for (int i = 0; i < timeArray.Count; i++) {
				byteArray.Add (timeArray [timeArray.Count - i - 1]);
			}

			string printableString = "";
			for (int i = 0; i < byteArray.Count; i++) {
				printableString += byteArray [i];
				printableString += " ";
			}

			Debug.Log (printableString);

			return byteArray;
		}

		private static List<byte> GetAnalyticsByteArrayForControl(Control theControl, DeviceID theID)
		{
			List <byte> byteArray = new List<byte> ();

			byteArray.Add (HeepLanguage.AnalyticsData);
			HeepLanguage.AddDeviceIDToMemory (byteArray, theID);

			List <byte> timeArray = GetMillisecondsByteArray ();

			byte numBytes = (byte)(timeArray.Count + 5);

			byteArray.Add (numBytes);
			byteArray.Add ((byte)theControl.GetID());
			byteArray.Add (1); // Only support 1 byte control values with this right now
			byteArray.Add((byte)theControl.GetCurValue());
			byteArray.Add (1); // Unity is only running on absolute time for the moment
			byteArray.Add ((byte)timeArray.Count);

			for (int i = 0; i < timeArray.Count; i++) {
				byteArray.Add (timeArray [timeArray.Count - i - 1]);
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
