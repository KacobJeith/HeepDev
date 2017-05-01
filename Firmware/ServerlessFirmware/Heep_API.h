#include "Simulation_HeepComms.h"
#include "Scheduler.h"

void SendOutputByID(unsigned char controlID, unsigned int value)
{
	SetControlValueByID(controlID, value);

	Vertex newVertex;

	for(int i = 0; i < numberOfVertices; i++)
	{
		GetVertexAtPonter(vertexPointerList[i], newVertex);

		if(newVertex.txID == deviceID && newVertex.txControlID == controlID)
		{
			FillOutputBufferWithSetValCOP(newVertex.rxControlID, value);
			SendOutputBufferToIP(newVertex.rxIPAddress);
		}
	}
}

enum Tasks {Defragment = 0, saveMemory = 1, CheckForSave = 2};
void SetupHeepTasks()
{

}

void PerformHeepTasks()
{
	// if Scheduled, defragment!
	// if Scheduled, check your IP
	// if Scheduled, check to save
}