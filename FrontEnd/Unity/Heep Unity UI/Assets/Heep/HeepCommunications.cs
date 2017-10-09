using System;
using System.Net;  
using System.Net.Sockets;  
using System.Text;  
using System.Collections;
using System.Collections.Generic;
using System.Threading;

namespace Heep
{
	public class HeepCommunications
	{

		public static void StartHeepServer(HeepDevice device)
		{
			Thread t = new Thread (() => StartListening (device));
			t.Start();
		}


		// Incoming data from the client.  
		public static string data = null;  

		public static void StartListening(HeepDevice device) {  
			// Data buffer for incoming data.  
			byte[] bytes = new Byte[1024];  

			byte [] IPAddrArray = {0, 0, 0, 0};
			IPAddress theAddr = new IPAddress(IPAddrArray);
			IPEndPoint localEndPoint = new IPEndPoint(theAddr, 5000);  

			// Create a TCP/IP socket.  
			Socket listener = new Socket(AddressFamily.InterNetwork,  
				SocketType.Stream, ProtocolType.Tcp );  

			// Bind the socket to the local endpoint and   
			// listen for incoming connections.  
			try {  
				listener.Bind(localEndPoint);  
				listener.Listen(10);  

				// Start listening for connections.  
				while (true) {  
					Console.WriteLine("Waiting for a connection...");  
					// Program is suspended while waiting for an incoming connection.  
					Socket handler = listener.Accept(); 

					Console.WriteLine("Data accepted");

					data = null;  

					bytes = new byte[1024];  
					int bytesRec = handler.Receive(bytes); 
					Console.WriteLine(bytesRec);
					data += Encoding.ASCII.GetString(bytes,0,bytesRec); 

					// Show the data on the console.  
					Console.WriteLine( "Text received : {0}", data);  

					List <byte> commandData = new List<byte> ();
					for(int i = 0; i < bytesRec; i++)
					{
						commandData.Add(bytes[i]);
					}

					// Echo the data back to the client.  
//					byte[] msg = Encoding.ASCII.GetBytes(data); 
					List <byte> fromparser = HeepParser.ParseCommand(commandData, device);
					byte[] msg = new byte[fromparser.Count];

					for(int i = 0; i < fromparser.Count; i++)
					{
						msg[i] = fromparser[i];
					}


					handler.Send(msg);  
					handler.Shutdown(SocketShutdown.Both);  
					handler.Close();  
				}  

			} catch (Exception e) {  
				Console.WriteLine(e.ToString());  
			}  

			Console.WriteLine("\nPress ENTER to continue...");  
			Console.Read();  

		}  

		public static void SendBufferToIP(List <byte> buffer, IPAddress theAddr)
		{
			Socket soc = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
			System.Net.IPEndPoint remoteEP = new IPEndPoint(theAddr, 5000);

			Console.WriteLine ("about to connect");
			soc.Connect(remoteEP);
			Console.WriteLine ("Connected");

			//Start sending stuf..
			soc.Send(buffer.ToArray());

			Console.WriteLine ("Sending");

			byte[] receiveBuffer = new byte[1024];
			int iRx = soc.Receive(receiveBuffer);
			char[] chars = new char[iRx];

			System.Text.Decoder d = System.Text.Encoding.UTF8.GetDecoder();
			System.String recv = new System.String(chars);
			Console.WriteLine (recv);
		}

		public HeepCommunications ()
		{
		}
	}
}

