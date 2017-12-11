using System;  
using System.Net;  
using System.Net.Sockets;  
using System.Threading;  
using System.Text;  
using System.Collections;
using System.Collections.Generic;

namespace Heep
{
	// State object for receiving data from remote device.  
	public class StateObject {  
		// Client socket.  
		public Socket workSocket = null;  
		// Size of receive buffer.  
		public const int BufferSize = 256;  
		// Receive buffer.  
		public byte[] buffer = new byte[BufferSize];  
		// Received data string.  
		public StringBuilder sb = new StringBuilder();  
	}  

	public class AsynchronousClient {  
		// The port number for the remote device.  
		private const int port = 5000;  

		// ManualResetEvent instances signal completion.  
		private static ManualResetEvent connectDone =   
			new ManualResetEvent(false);  
		private static ManualResetEvent sendDone =   
			new ManualResetEvent(false);  
		private static ManualResetEvent receiveDone =   
			new ManualResetEvent(false);  

		// The response from the remote device.  
		private static String response = String.Empty;  

		public static void StartClient(object ipAddrPassed) {  
			// Connect to a remote device.  
			try {  
				IPAddress ipAddr = (IPAddress)ipAddrPassed;
				Console.WriteLine(ipAddr);

				// Establish the remote endpoint for the socket.  
				// The name of the   
				// remote device is "host.contoso.com".    
				IPEndPoint remoteEP = new IPEndPoint(ipAddr, port);  

				// Create a TCP/IP socket.  
				Socket client = new Socket(AddressFamily.InterNetwork,  
					SocketType.Stream, ProtocolType.Tcp);  

				// Connect to the remote endpoint.  
				IAsyncResult result = client.BeginConnect( remoteEP,   
					new AsyncCallback(ConnectCallback), client);  

			} catch (Exception e) {  
				Console.WriteLine(e.ToString());  
			}  
		}  

		private static void ConnectCallback(IAsyncResult ar) {  
			try {  
				// Retrieve the socket from the state object.  
				Socket client = (Socket) ar.AsyncState;  

				// Complete the connection.  
				client.EndConnect(ar);  

				Console.WriteLine("Socket connected to {0}",  
					client.RemoteEndPoint.ToString());  

				// Signal that the connection has been made.  
				connectDone.Set();  

				// Send test data to the remote device. 
				List <byte> buffer = new List<byte>();
				buffer.Add( (byte) 0x09);
				Send(client, buffer);  
				sendDone.WaitOne();  

				// Receive the response from the remote device.  
				Receive(client);  
				receiveDone.WaitOne();  

				// Write the response to the console.  
				Console.WriteLine("Response received : {0}", response);  

				// Release the socket.  
				client.Shutdown(SocketShutdown.Both);  
				client.Close();  

			} catch (Exception e) {  
				Console.WriteLine(e.ToString());  
			}  
		}  

		private static void Receive(Socket client) {  
			try {  
				// Create the state object.  
				StateObject state = new StateObject();  
				state.workSocket = client;  

				// Begin receiving the data from the remote device.  
				client.BeginReceive( state.buffer, 0, StateObject.BufferSize, 0,  
					new AsyncCallback(ReceiveCallback), state);  
			} catch (Exception e) {  
				Console.WriteLine(e.ToString());  
			}  
		}  

		private static void ReceiveCallback( IAsyncResult ar ) {  
			try {  
				// Retrieve the state object and the client socket   
				// from the asynchronous state object.  
				StateObject state = (StateObject) ar.AsyncState;  
				Socket client = state.workSocket;  

				// Read data from the remote device.  
				int bytesRead = client.EndReceive(ar);  

				if (bytesRead > 0) {  
					// There might be more data, so store the data received so far.  
					state.sb.Append(Encoding.ASCII.GetString(state.buffer,0,bytesRead));  

					// Get the rest of the data.  
					client.BeginReceive(state.buffer,0,StateObject.BufferSize,0,  
						new AsyncCallback(ReceiveCallback), state);  
				} else {  
					// All the data has arrived; put it in response.  
					if (state.sb.Length > 1) {  
						response = state.sb.ToString();  
					}  
					// Signal that all bytes have been received.  
					receiveDone.Set();  
				}  
			} catch (Exception e) {  
				Console.WriteLine(e.ToString());  
			}  
		}  

		private static void Send(Socket client, List <byte> data) {  
			// Begin sending the data to the remote device.  
			client.BeginSend(data.ToArray(), 0, data.Count, 0,  
				new AsyncCallback(SendCallback), client);  
		}  

		private static void SendCallback(IAsyncResult ar) {  
			try {  
				// Retrieve the socket from the state object.  
				Socket client = (Socket) ar.AsyncState;  

				// Complete sending the data to the remote device.  
				int bytesSent = client.EndSend(ar);  
				Console.WriteLine("Sent {0} bytes to server.", bytesSent);  

				// Signal that all bytes have been sent.  
				sendDone.Set();  
			} catch (Exception e) {  
				Console.WriteLine(e.ToString());  
			}  
		}  

	}

}