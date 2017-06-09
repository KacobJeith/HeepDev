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

void WriteMacAddress(uint8_t* buf);
void ReadMacAddress(uint8_t* buf);

void WriteSourceIP(uint8_t* buf);
void ReadSourceIP(uint8_t* buf);

void WriteDefaultGateway(uint8_t* buf);
void ReadDefaultGateway(uint8_t* buf);

void SetSocketRXSize(uint8_t socket, uint8_t size);
void SetSocketTXSize(uint8_t socket, uint8_t size);

uint8_t TestW5500RegisterWriting();

#endif	/* W5500_H */

