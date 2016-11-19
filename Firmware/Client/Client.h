#include "../Utilities/GlobalDefines.h"
#include "../ControlValue/ControlValue.h"

#ifdef ONPC
#include <string>
#endif

class Client {
public:
	Client();

#ifdef ONPC
	Client(int ID, std::string name, int numControls);
#else
	Client(int ID, String name, int numControls)
#endif
	~Client();	

	// Setters
	void 			AddControlToClient(ControlValue ctrlVal) {controlValueList.AddControlValToList(ctrlVal);};

	// Getters
	int 			GetClientID() 					{return clientID; };
	ControlValue 	GetControlAtIndex(int index) 	{return controlValueList.GetControlAtIndex(index); };

#ifdef ONPC
	std::string GetClientName() {return clientName; };
	std::string GetClientString();
#else
	String 		GetClientName() {return clientName; };
	String 		GetClientString();
#endif

private:
	int clientID;
	int clientType;
	ControlValList controlValueList;

#ifdef ONPC
	std::string clientName;
	std::string clientIP;
#else
	String clientName;
	String clientIP;
#endif

};