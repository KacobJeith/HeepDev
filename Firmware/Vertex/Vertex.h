class Vertex {
public:

	Vertex();
	~Vertex();	
};

struct VertexNode{
	VertexNode* next;
	Vertex controlData;
};

void AddVertexToList(VertexNode* head, Vertex vert);
VertexNode* InitializeVertexList(Vertex vert);
