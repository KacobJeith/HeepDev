#include "mcc_generated_files/mcc.h"

enum pinType {input, output};
void PinMode(int pin, enum pinType type);
void DigitalWrite(int pin, int value);
int DigitalRead(int pin);

uint8_t GetPortFromPinNumber(int pinNumber);