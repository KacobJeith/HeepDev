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

		public static void StartHeepServer(HeepDevice device)
		{
			Thread t = new Thread (() => StartListening (device));
			t.Start();
		}


		// Incoming data from the client.  
		public static string data = null;  

		public static void StartListening(HeepDevice device) {  

			UdpClient client = new UdpClient(PORT);
			byte[] recData;
			while (true)
			{
				try
				{
					IPEndPoint anyIP = new IPEndPoint(IPAddress.Any, 0);
					recData = client.Receive(ref anyIP);
					List <byte> commandData = new List<byte>(recData);
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

