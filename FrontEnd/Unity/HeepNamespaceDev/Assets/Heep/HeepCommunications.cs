using System;
using System.Net;  
using System.Net.Sockets;  
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

					if(HeepParser.isROP(commandData)) return;

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

		public HeepCommunications ()
		{
		}
	}
}

