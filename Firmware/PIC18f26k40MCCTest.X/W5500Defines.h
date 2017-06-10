// COMMON REGISTER
// Mode Register (MR)
#define MR 0x0000
// Gateway Address (GAR) - 0x0001->0x0004
#define GAR0 0x0001
// Subnet Mask Address (SUBR) - 0x0005->0x0008
#define SUBR0 0x0005
// Source Hardware Address [MAC Address] (SHAR) - 0x0009->0x000E
#define SHAR0 0x0009
// Source IP Address (SIPR) - 0x000F->0x0012
#define SIPR 0x000F
// Phy configuration Register (PHYCFGR)
#define PHYCFGR 0x002E

// SOCKET REGISTERS
// Socket n Mode
#define Sn_MR 0x0000
// Socket n Command
#define Sn_CR 0x0001
// Socket n Status
#define Sn_SR 0x0003
// Socket Destination IP [Sn_DIPR] - 0x000C -> 0c000F
#define Sn_DIPR0 0x000C
// Socket Destination Port [Sn_DPORT] - 0x0010 -> 0x0011 
#define Sn_DPORT0 0x0010
// Receive Buffer Size Register
#define Sn_RXBUF_SIZE 0x001E
// Send Buffer Size Register
#define Sn_TXBUF_SIZE 0x001F

// Socket Register Settings
// Sn_MR Bits (Socket Mode)
#define Sn_MR_CLOSE     0x00
#define Sn_MR_TCP       0x01
#define Sn_MR_UDP       0x02
#define Sn_MR_MACRAW    0x04
#define Sn_MR_PPPOE     0x05
#define Sn_MR_ND        0x20
#define Sn_MR_MULTI     0x80

// Sn_CR Bits (Socket Command))
#define Sn_CR_OPEN      0x01
#define Sn_CR_LISTEN    0x02
#define Sn_CR_CONNECT   0x04
#define Sn_CR_DISCON    0x08
#define Sn_CR_CLOSE     0x10
#define Sn_CR_SEND      0x20
#define Sn_CR_SEND_MAC  0x21
#define Sn_CR_SEND_KEEP 0x22
#define Sn_CR_RECV      0x40