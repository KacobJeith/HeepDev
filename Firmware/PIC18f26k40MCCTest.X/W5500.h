#ifndef W5500_H
#define	W5500_H

void InitializeW5500();
void ResetW5500();
void SetW5500SS();
void ResetW5500SS();

void WriteToW5500(uint16_t addr, uint8_t controlBit, uint8_t* buf, uint16_t len);
void ReadFromW5500(uint16_t addr, uint8_t controlBit, uint8_t* buf, uint16_t len);
void WriteSubnetMask(uint8_t* buf);
void ReadSubnetMask(uint8_t* buf);


#endif	/* W5500_H */

