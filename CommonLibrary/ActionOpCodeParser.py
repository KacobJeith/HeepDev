class ActionOpCodeParser:

	SetValueOpCode = chr(0x0A)

	def __init__(self) :
		return

	def ExecuteSetValue(self, byteArray, HeepClient) :
		

	def GetActionOpCodeFromByteArray(self, byteArray, HeepClient) :

		AOpCode = byteArray[0]

		if AOpCode == self.SetValueOpCode :
			self.ExecuteSetValue(byteArray)

		return
