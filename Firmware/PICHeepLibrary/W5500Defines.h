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
// Socket n Interrupt Register
#define Sn_IR 0x0002
// Socket n Status
#define Sn_SR 0x0003
// Socket Destination IP [Sn_DIPR] - 0x000C -> 0c000F
#define Sn_DIPR0 0x000C
// Socket Destination Port [Sn_DPORT] - 0x0010 -> 0x0011 
#define Sn_DPORT0 0x0010
// Socket Source Port [Sn_PORT] - 0x0004 -> 0x0005
#define Sn_PORT0 0x0004
// Receive Buffer Size Register
#define Sn_RXBUF_SIZE 0x001E
// Send Buffer Size Register
#define Sn_TXBUF_SIZE 0x001F
// RX Recieve Pointer Register - 0x0022 -> 0x0023
#define Sn_RX_RD0 0x0028
// TX Write Pointer Register - 0x0024 -> 0x0025
#define Sn_TX_WR0 0x0024
// RX Recieved Size - 0x0026 -> 0x0027
#define Sn_RX_RSR0 0x0026

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

//Sn SR Bits (Socket Status)
#define Sn_SR_CLOSED        0x00
#define Sn_SR_INIT          0x13
#define Sn_SR_LISTEN        0x14
#define Sn_SR_SYNSENT       0x15
#define Sn_SR_SYNRECV       0x16
#define Sn_SR_ESTABLISHED   0x17
#define Sn_SR_FIN_WAIT      0x18
#define Sn_SR_CLOSING       0x1A
#define Sn_SR_TIME_WAIT     0x1B
#define Sn_SR_CLOSE_WAIT    0x1C
#define Sn_SR_LAST_ACK      0x1D
#define Sn_SR_UDP           0x22
#define Sn_SR_IPRAW         0x32
#define Sn_SR_MACRAW        0x42
#define Sn_SR_PPPOE         0x5F

//Sn IR
#define Sn_IR_SEND_OK       0x10;
#define Sn_IR_TIMEOUT       0x08;
#define Sn_IR_RECV          0x04;
#define Sn_IR_DISCON        0x02;
#define Sn_IR_CON           0x01;