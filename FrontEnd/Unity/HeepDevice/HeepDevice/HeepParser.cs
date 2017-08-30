using System;
using System.Collections;
using System.Collections.Generic;

namespace Heep
{
	public static class HeepParser
	{
		public static List<byte> ParseCommand(List <byte> commandBuffer, HeepDevice theDevice)
		{
			if (commandBuffer [0] == HeepLanguage.IsHeepDeviceOpCode) {
				return ParseIsHeepDeviceCommand (commandBuffer, theDevice);
			} else if (commandBuffer [0] == HeepLanguage.SetValueOpCode) {
				// CALL SET VAL PARSER
			}

			List<byte> defaultRet = new List<byte> ();
			return defaultRet;
		}

		public static List<byte> ParseIsHeepDeviceCommand(List <byte> commandBuffer, HeepDevice theDevice)
		{
			return theDevice.GetMemoryDump ();
		}

		public static List<byte> ParseSetValueCommand(List <byte> commandBuffer, HeepDevice theDevice)
		{
			List <byte> outputBuf = new List<byte>();
			return outputBuf;
		}
	}
}

