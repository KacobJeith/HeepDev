#include "../Utilities/globalDefines.h"

#ifdef ONPC
#include <string>
#endif

class PLCString{
public:
#ifdef ONPC
	PLCString(std::string myString) {_string = myString;};
#else
	PLCString(String myString) {_string = myString;};
#endif

	~PLCString() {};

#ifdef ONPC
	int Equals(std::string newString) {return _string == newString;};
	void Append(std::string newString) {_string = _string+newString;};
	std::string GetString() {return _string; };
#else
	int Equals(String newString) {return _string == newString;};
	void Append(String newString) {_string = _string+newString;};
	String GetString() {return _string; };
#endif

private:

#ifdef ONPC
	std::string _string;
#else
	String _string;
#endif
};