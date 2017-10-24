using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;  
using System.Net.NetworkInformation; 
using System.Linq;

namespace Heep
{
	public static class DeviceSearch
	{
		public static IPAddress GetDefaultGateway()
		{
			return NetworkInterface
				.GetAllNetworkInterfaces()
				.Where(n => n.OperationalStatus == OperationalStatus.Up)
				.Where(n => n.NetworkInterfaceType != NetworkInterfaceType.Loopback)
				.SelectMany(n => n.GetIPProperties()?.GatewayAddresses)
				.Select(g => g?.Address)
				.Where(a => a != null)
				// .Where(a => a.AddressFamily == AddressFamily.InterNetwork)
				// .Where(a => Array.FindIndex(a.GetAddressBytes(), b => b != 0) >= 0)
				.FirstOrDefault();
		}

		public static void SearchForDevices()
		{
			Console.WriteLine (GetDefaultGateway ());
//			List <byte> searchBuffer;
			//searchBuffer.Add (0x09);

//			HeepCommunications.SendBufferToIP(searchBuffer, 
		}
	}
}

