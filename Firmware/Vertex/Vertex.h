#include "../Utilities/globalDefines.h"

#ifdef ONPC
#include <string>
#endif

class Vertex {
public:

	Vertex();
#ifdef ONPC
	Vertex(std::string inputStr, std::string outputStr, std::string destIP, int destID, int srcID);
	Vertex(std::string VertexString);
#else
	Vertex(String inputStr, String outputStr, String destIP, int destID, int srcID);
	Vertex(String VertexString);

#endif
	~Vertex();

private:
#ifdef ONPC
	std::string inputName;
	std::string outputName;
	std::string destinationIP;
#else
	String inputName;
	String outputName;
	String destinationIP;
#endif
	int destinationID;
	int sourceID;
};

struct VertexNode{
	VertexNode* next;
	Vertex controlData;
};

void AddVertexToList(VertexNode* head, Vertex vert);
VertexNode* InitializeVertexList(Vertex vert);
