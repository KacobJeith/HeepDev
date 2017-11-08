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
					anyIP.Port = 5000;

					Debug.Log("IP Address: " + anyIP.Address + " Port: " + anyIP.Port);
					Debug.Log("UDP Data Received: " + Encoding.ASCII.GetString(commandData.ToArray(),0,commandData.Count));

					String printableReturn = "";
					for(int i = 0; i < fromparser.Count; i++)
					{
						printableReturn += fromparser[i] + " ";
					}
					Debug.Log("Sending: " + printableReturn);

					UdpClient udpClientB = new UdpClient();
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
			Socket soc = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

			System.Net.IPEndPoint remoteEP = new IPEndPoint(theAddr, 5000);

			Console.WriteLine ("about to connect");
			soc.Connect(remoteEP);
			Console.WriteLine ("Connected");

			//Start sending stuff..
			soc.Send(buffer.ToArray());

			Console.WriteLine ("Sending");

			byte[] receiveBuffer = new byte[1024];
			int iRx = soc.Receive(receiveBuffer);

			List <byte> retBuffer = new List<byte> ();
			for (int i = 0; i < iRx; i++) {
				retBuffer.Add (receiveBuffer [i]);
			}

			for (int i = 0; i < retBuffer.Count; i++) {
				
				Console.Write(retBuffer[i] + " ");
			}
			Console.WriteLine ();

			return retBuffer;
		}

		public HeepCommunications ()
		{
		}
	}
}

