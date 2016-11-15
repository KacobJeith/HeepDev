class Client {
public:
	Client();
	Client(int ID, char* name);
	~Client();	

	// Getters
	char* 	GetClientName() {return clientName; };
	int 	GetClientID() 	{return clientID; };

private:
	int clientID;
	char* clientName;
};