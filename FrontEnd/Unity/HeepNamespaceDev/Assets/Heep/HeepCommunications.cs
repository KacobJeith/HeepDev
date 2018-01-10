using System;
using System.Net;  
using System.Net.Sockets;  
using System.IO;
using System.Text;  
using System.Collections;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;

namespace Heep
{
	public class HeepCommunications
	{
		public static int PORT = 5000;

		public static void StartHeepServer(HeepDevice device, UdpClient client)
		{
			Thread t = new Thread (() => StartListening (device, client));
			t.Start();
		}

		// Incoming data from the client.  
		public static string data = null;  

		public static UdpClient GetHeepInterruptServer()
		{
			return new UdpClient (PORT);
		}

		public static void StartListening(HeepDevice device, UdpClient client) {  

			byte[] recData;
			while (true)
			{
				try
				{
					IPEndPoint anyIP = new IPEndPoint(IPAddress.Any, 0);
					Debug.Log("About to receive");
					recData = client.Receive(ref anyIP);
					Debug.Log("Received");
					List <byte> commandData = new List<byte>(recData);

					if(HeepParser.isROP(commandData))
					{
						Debug.Log("Was ROP");
						continue;
					}

					List <byte> fromparser = HeepParser.ParseCommand(commandData, device);

					Debug.Log("IP Address: " + anyIP.Address + " Port: " + anyIP.Port);
					Debug.Log("UDP Data Received: " + Encoding.ASCII.GetString(commandData.ToArray(),0,commandData.Count));

					String printableReturn = "";
					for(int i = 0; i < fromparser.Count; i++)
					{
						printableReturn += fromparser[i] + " ";
					}
					Debug.Log("Sending: " + printableReturn);

					UdpClient udpClientB = new UdpClient();
					anyIP.Port = PORT;
					udpClientB.Send(fromparser.ToArray(), fromparser.Count, anyIP);

				}
				catch (ObjectDisposedException) {
					Debug.Log ("Server disposed");
					return;
				}
				catch (Exception err)
				{
					Debug.Log("UDP Exception: " + err.ToString());

				}
			}

		}  

		public static List <byte> SendBufferToIP(List <byte> buffer, IPAddress theAddr)
		{
			UdpClient udpClient = new UdpClient();

			System.Net.IPEndPoint remoteEP = new IPEndPoint(theAddr, 5000);

			//Start sending stuff..
			udpClient.Send(buffer.ToArray(), buffer.Count, remoteEP);

			List <byte> retBuffer = new List<byte> ();
			return retBuffer;
		}

		public static void SendAnalytics(DeviceID deviceID, List<byte> memoryDump)
		{
			List<byte> deviceIDList = deviceID.GetIDArray ();
			string base64deviceID = Convert.ToBase64String(deviceIDList.ToArray());

			Debug.Log ("Saving Analytics for " + base64deviceID);
			string url = "https://heep-3cddb.firebaseio.com/analytics/" + base64deviceID + ".json";

			string base64 = Convert.ToBase64String(memoryDump.ToArray());
			string data = "\""+ base64 + "\"";

			POST(url, data);
		}

		static void POST(string url, string jsonContent) 
		{
			HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
			request.Method = "PUT";

			System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
			Byte[] byteArray = encoding.GetBytes(jsonContent);

			request.ContentLength = byteArray.Length;
			request.ContentType = @"application/json";

			using (Stream dataStream = request.GetRequestStream()) {
				dataStream.Write(byteArray, 0, byteArray.Length);
			}
			long length = 0;
			try {
				using (HttpWebResponse response = (HttpWebResponse)request.GetResponse()) {
					length = response.ContentLength;
				}
			}
			catch (WebException ex) {
				Debug.LogException(ex);
			}
		}


		public HeepCommunications ()
		{
		}
	}
}

