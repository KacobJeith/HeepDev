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
				List<byte> returnedCode = HeepCommunications.SendBufferToIP (Buffer, (IPAddress)currentIP);
				HeepParser.ParseROP(returnedCode);
			}
			catch(Exception e) {
				Console.Write ("FAILED: ");
				Console.Write (e.Data);
			}
		}

		public static void SearchForDevices()
		{
			IPAddress defaultGateway = GetDefaultGateway ();

			for (var i = 28; i <= 31; i++) {
				byte[] IPAddrArray = defaultGateway.GetAddressBytes ();
				IPAddrArray [3] = (byte)i;
				IPAddress theAddr = new IPAddress(IPAddrArray);
				Task.Factory.StartNew (() => DeviceSearchWorker(theAddr));
			}
				
		}
			
	}
}

