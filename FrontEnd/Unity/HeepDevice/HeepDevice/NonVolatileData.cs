using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;

namespace Heep
{
	public static class NonVolatileData
	{
		public static void WriteMemoryToFile(List<Byte> memory)
		{
			// Create a file to write to.
			File.WriteAllBytes ("DeviceMemory.bin", memory.ToArray ());
		}

		public static List<Byte> ReadMemoryFromFile()
		{
			byte [] memArr = File.ReadAllBytes ("DeviceMemory.bin");
			return new List<Byte> (memArr);
		}
	}
}

