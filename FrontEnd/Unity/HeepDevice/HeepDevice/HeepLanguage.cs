using System;

namespace Heep
{
	public class HeepLanguage
	{
		// OpCodes
		public const byte ClientDataOpCode 		 	= 0x01;
		public const byte ControlOpCode 			= 0x02;
		public const byte VertexOpCode 			 	= 0x03;
		public const byte IconIDOpCode 			 	= 0x04;
		public const byte CustomIconDrawingOpCode 	= 0x05;
		public const byte DeviceNameOpCode 		 	= 0x06;
		public const byte FrontEndPositionOpCode	= 0x07;
		public const byte DeviceIPOpCode 			= 0x08;
													  
		public const byte IsHeepDeviceOpCode 		= 0x09;
		public const byte SetValueOpCode 			= 0x0A;
		public const byte SetPositionOpCode 		= 0x0B;
		public const byte SetVertexOpCode 		 	= 0x0C;
		public const byte DeleteVertexOpCode 		= 0x0D;
		public const byte EchoOpCode 				= 0x0E;
													  
		public const byte MemoryDumpOpCode 			= 0x0F;
		public const byte SuccessOpCode 			= 0x10;
		public const byte ErrorOpCode 				= 0x11;
													  
		public const byte FragmentOpCode 			= 0x12;
													  
		public const byte AddMOPOpCode 				= 0x13;
		public const byte DynamicMemorySizeOpCode 	= 0x14;
		public const byte DeleteMOPOpCode 			= 0x15;
		public const byte LocalDeviceIDOpCode 		= 0x16;

		public HeepLanguage ()
		{
		}
	}
}

