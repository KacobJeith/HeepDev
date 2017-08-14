using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using System.Net;
using System.Net.Sockets;
using System;
using System.IO;
using System.Text;

public class SearchForDevices : MonoBehaviour, IPointerDownHandler {

	#region IPointerDownHandler implementation

	public void OnPointerDown (PointerEventData eventData)
	{
		Debug.Log("You have clicked the button!");

		//
		//		byte[] bytes = new byte[1024];  
		//
		//		// Connect to a remote device.  
		//		try {  
		//			// Establish the remote endpoint for the socket.  
		//			// This example uses port 11000 on the local computer.  
		//			IPHostEntry ipHostInfo = Dns.Resolve(Dns.GetHostName());  
		//			//			IPHostEntry ipHostInfo = Dns.GetHostEntry("localhost"); 
		//			IPAddress ipAddress = ipHostInfo.AddressList[0];  
		//			IPEndPoint remoteEP = new IPEndPoint(ipAddress,5555);  
		//
		//			Debug.Log(ipAddress);
		//
		//			// Create a TCP/IP  socket.  
		//			Socket sender = new Socket(AddressFamily.InterNetwork,   
		//				SocketType.Stream, ProtocolType.Tcp );  
		//
		//			// Connect the socket to the remote endpoint. Catch any errors.  
		//			try {  
		//				sender.Connect(remoteEP);  
		//
		//				Debug.Log("Socket connected to " + sender.RemoteEndPoint.ToString());  
		//
		//				// Encode the data string into a byte array.  
		//				byte[] msg = Encoding.ASCII.GetBytes("This is a test<EOF>");  
		//
		//				Debug.Log(msg);
		//
		//				// Send the data through the socket.  
		//				int bytesSent = sender.Send(msg);  
		//
		//				Debug.Log("Sent Data");
		//
		//				// Receive the response from the remote device.  
		//				int bytesRec = sender.Receive(bytes);  
		//				Debug.Log("Echoed test = " + Encoding.ASCII.GetString(bytes,0,bytesRec));  
		//
		//				// Release the socket.  
		//				//				sender.Shutdown(SocketShutdown.Both);  
		//				sender.Close();  
		//
		//			} catch (ArgumentNullException ane) {  
		//				Debug.Log("ArgumentNullException : " + ane.ToString());  
		//			} catch (SocketException se) {  
		//				Debug.Log("SocketException : " + se.ToString());  
		//			} catch (Exception e) {  
		//				Debug.Log("Unexpected exception : " + e.ToString());  
		//			}  
		//
		//		} catch (Exception e) {  
		//			Debug.Log( e.ToString());  
		//		}  
	}

	#endregion

}