#include "mcc_generated_files/mcc.h"

enum pinType {input, output};
enum outType {high = 1, low = 0};
void PinMode(int pin, enum pinType type);
void DigitalWrite(int pin, enum outType value);
int DigitalRead(int pin);
