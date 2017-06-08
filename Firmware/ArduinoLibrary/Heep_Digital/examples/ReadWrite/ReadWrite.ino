/*
 * Very Simple Example of reading an input to write an output to the same value using the Heep libraries.
 * Primary intention of this library is so that client code can become cross platform
 */
#include <Heep_Digital.h>

Heep_Digital_Input myInput(2);
Heep_Digital_Output myOutput(3);

void setup()
{
	
}

void loop()
{
	if(myInput.ShouldToggle())
	{
		myOutput.Write(myInput.Read());
	}
}