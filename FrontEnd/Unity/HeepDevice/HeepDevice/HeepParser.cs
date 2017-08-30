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
				// CALL IS HEEP DEVICE PARSER
			} else if (commandBuffer [0] == HeepLanguage.SetValueOpCode) {
				// CALL SET VAL PARSER
			}

			List<byte> defaultRet = new List<byte> ();
			return defaultRet;
		}

		public static List<byte> ParseIsHeepDeviceCommand(List <byte> commandBuffer, HeepDevice theDevice)
		{
			List <byte> outputBuf = new List<byte>();
			return outputBuf;
		}
	}
}

