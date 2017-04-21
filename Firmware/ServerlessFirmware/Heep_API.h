#include "ENC28J60_HeepComms.h"

void SendOutputByID(unsigned char controlID, unsigned int value)
{
	SetControlValueByID(controlID, value);

	Vertex newVertex;

	for(int i = 0; i < numberOfVertices; i++)
	{
		GetVertexAtPonter(vertexPointerList[i], newVertex);

		if(newVertex.txID == deviceID && newVertex.txControlID == controlID)
		{
			FillOutputBufferWithSetValCOP(controlID, value);
			SendOutputBufferToIP(newVertex.rxIPAddress);
		}
	}
}