#include "../Utilities/globalDefines.h"

#ifdef ONPC
#include <string>
#endif

class Vertex {
public:

	Vertex();
	~Vertex();

private:
	std::string inputName;
	std::string outputName;
	int destinationID;
	std::string destinationIP;
	int sourceID;
};

struct VertexNode{
	VertexNode* next;
	Vertex controlData;
};

void AddVertexToList(VertexNode* head, Vertex vert);
VertexNode* InitializeVertexList(Vertex vert);
