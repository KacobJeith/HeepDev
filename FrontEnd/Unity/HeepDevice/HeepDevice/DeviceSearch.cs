using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;  
using System.Net.NetworkInformation; 
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

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

		private static void DeviceSearchWorker(object currentIP)
		{
			Console.WriteLine ((IPAddress) currentIP);

			List <byte> Buffer = new List<byte>();
			Buffer.Add ((byte)0x09);

			try{
				HeepCommunications.SendBufferToIP (Buffer, (IPAddress)currentIP);
			}
			catch(Exception e) {
				Console.Write (e.Data);
			}
		}

		public static void SearchForDevices()
		{
			IPAddress defaultGateway = GetDefaultGateway ();

//			for (var i = 2; i <= 255; i++) {
//				byte[] IPAddrArray = defaultGateway.GetAddressBytes ();
//				IPAddrArray [3] = (byte)i;
//				IPAddress theAddr = new IPAddress(IPAddrArray);
//				Task.Factory.StartNew (() => DeviceSearchWorker (theAddr));
//			}

			Parallel.For (2, 255, i => {
				byte[] IPAddrArray = defaultGateway.GetAddressBytes ();
				IPAddrArray [3] = (byte)i;
				IPAddress theAddr = new IPAddress (IPAddrArray);
				DeviceSearchWorker (theAddr);
//				Task.Factory.StartNew (() => DeviceSearchWorker (theAddr));
			});
		}
			
	}
}

