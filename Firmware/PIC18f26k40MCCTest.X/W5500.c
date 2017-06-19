#include "mcc_generated_files/mcc.h"
#include "W5500.h"
#include "W5500Defines.h"

#define NUMBER_OF_SOCKETS 8

#define SS_PIN_TRIS TRISCbits.TRISC0
#define SS_PIN LATCbits.LATC0
#define RESET_PIN_TRIS TRISCbits.TRISC2
#define RESET_PIN LATCbits.LATC2
#define INT_PIN_TRIS TRISCbits.TRISC1
#define INT_PIN LATCbits.LATC1

void InitializeW5500()
{
    SS_PIN_TRIS = 0;
    RESET_PIN_TRIS = 0;
    INT_PIN_TRIS = 1;
    
    SS_PIN = 1;
    RESET_PIN = 1;
    
    ResetW5500();
    
    W5500SoftwareReset();
    for(int i = 0; i < NUMBER_OF_SOCKETS; i++)
    {
        SetSocketRXSize(i, 2);
        SetSocketTXSize(i, 2);
    }
}

void ResetW5500()
{   
    RESET_PIN = 0;
    
    for(unsigned long i = 0; i < 65535; i++)
    {
        Nop();
    }
    
    RESET_PIN = 1;
        
    for(unsigned long i = 0; i < 65535; i++)
    {
        Nop();
    }
}

void SetW5500SS()
{
    SS_PIN = 0;
}

void ResetW5500SS()
{
    SS_PIN = 1;
}


/* 
 * SPI on W5500 works in 3 phases.
 * 1. Address Phase
 * 2. Control Phase
 * 3. Data Phase
 */
void WriteToW5500(uint16_t addr, uint8_t controlBit, uint8_t* buf, uint16_t len)
{
    SetW5500SS();
    
    SPI1_Exchange8bit(addr >> 8); // Get High Byte
    SPI1_Exchange8bit(addr & 0xff); // Get Low Byte
    SPI1_Exchange8bit(controlBit);
    
    uint16_t i = 0;
    for(i = 0; i < len; i++)
    {
        SPI1_Exchange8bit(buf[i]);
    }
    
    ResetW5500SS();
}

void ReadFromW5500(uint16_t addr, uint8_t controlBit, uint8_t* buf, uint16_t len)
{
    SetW5500SS();
    
    SPI1_Exchange8bit(addr >> 8); // Get High Byte
    SPI1_Exchange8bit(addr & 0xff); // Get Low Byte
    SPI1_Exchange8bit(controlBit);
    
    uint16_t i = 0;
    for(i = 0; i < len; i++)
    {
        buf[i] = SPI1_Exchange8bit(0);
    }
    
    ResetW5500SS();
}

void WriteSubnetMask(uint8_t* buf)
{
    WriteToW5500(SUBR0, 0b00000100, buf, 4);
}

void ReadSubnetMask(uint8_t* buf)
{
    ReadFromW5500(SUBR0, 0x00, buf, 4);
}

void WriteMacAddress(uint8_t* buf)
{
    WriteToW5500(SHAR0, 0b00000100, buf, 6);
}

void ReadMacAddress(uint8_t* buf)
{
    ReadFromW5500(SHAR0, 0x00, buf, 6);
}

void WriteSourceIP(uint8_t* buf)
{
    WriteToW5500(SIPR, 0b00000100, buf, 4);
}

void ReadSourceIP(uint8_t* buf)
{
    ReadFromW5500(SIPR, 0x00, buf, 4);
}

void WriteDefaultGateway(uint8_t* buf)
{
    WriteToW5500(GAR0, 0b00000100, buf, 4);
}

void ReadDefaultGateway(uint8_t* buf)
{
    ReadFromW5500(GAR0, 0x00, buf, 4);
}

uint8_t AreBufsEqual(uint8_t* buf1, uint8_t* buf2, uint8_t len)
{
    for(int i = 0; i < len; i++)
    {
        if(buf1[i] != buf2[i])
        {
            return 0;
        }
    }
    
    return 1;
}

void SetSocketRXSize(uint8_t socket, uint8_t size)
{
    uint8_t cntl_byte = (0x0C + (socket<<5));
    
    uint8_t buf [1];
    buf[0] = size;
    
    WriteToW5500(Sn_RXBUF_SIZE, cntl_byte, buf, 1);
}

void SetSocketTXSize(uint8_t socket, uint8_t size)
{
    uint8_t cntl_byte = (0x0C + (socket<<5));
     
    uint8_t buf [1];
    buf[0] = size;
    
    WriteToW5500(Sn_RXBUF_SIZE, cntl_byte, buf, 1);
}

void SetSingleByteW5500(uint16_t addr, uint8_t value)
{
    uint8_t buf [1];
    buf[0] = value;
    WriteToW5500(addr, 0b00000100, buf, 1);
}

uint8_t ReadSingleByteW5500(uint16_t addr)
{
    uint8_t buf [1];
    ReadFromW5500(addr, 0x00, buf, 1);
    return buf[0];
}

void SetSingleByteW5500WithCntl(uint16_t addr, uint8_t value, uint8_t cntl_byte)
{
    uint8_t buf [1];
    buf[0] = value;
    WriteToW5500(addr, cntl_byte, buf, 1);
}

uint8_t ReadSingleByteW5500WithCntl(uint16_t addr, uint8_t cntl_byte)
{
    uint8_t buf [1];
    ReadFromW5500(addr, cntl_byte, buf, 1);
    return buf[0];
}

void SetMR(uint8_t newVal)
{
    SetSingleByteW5500(MR, newVal);
}

uint8_t ReadMR()
{
    return ReadSingleByteW5500(MR);
}

uint8_t ReadPHYCFGR()
{
    return ReadSingleByteW5500(PHYCFGR);
}

void W5500SoftwareReset()
{
    uint8_t curMR = ReadMR();
    
    SetMR( curMR | 0x80 );
}

uint8_t GetWriteControlByteFromSocket(uint8_t socket)
{
    uint8_t cntl_byte = (0x0C + (socket<<5));
    return cntl_byte;
}

uint8_t GetReadControlByteFromSocket(uint8_t socket)
{
    uint8_t cntl_byte = (0x08 + (socket<<5));
    return cntl_byte;
}

uint8_t GetWriteControlByteFromSocketTx(uint8_t socket)
{
    uint8_t cntl_byte = (0x14 + (socket<<5));
    return cntl_byte;
}

uint8_t GetReadControlByteFromSocketRx(uint8_t socket)
{
    uint8_t cntl_byte = (0x18 + (socket<<5));
    return cntl_byte;
}

void WriteSourcePort(uint8_t socket, uint8_t* buf)
{
    WriteToW5500(Sn_PORT0, GetWriteControlByteFromSocket(socket), buf, 2);
}

void WriteDestinationIP(uint8_t socket, uint8_t* buf)
{
    WriteToW5500(Sn_DIPR0, GetWriteControlByteFromSocket(socket), buf, 4);
}

void WriteDestinationPort(uint8_t socket, uint8_t* buf)
{
    WriteToW5500(Sn_DPORT0, GetWriteControlByteFromSocket(socket), buf, 2);
}

void WriteSocketMode(uint8_t socket, uint8_t value)
{
   SetSingleByteW5500WithCntl(Sn_MR ,value, GetWriteControlByteFromSocket(socket));
}

uint8_t ReadSocketMode(uint8_t socket)
{
    uint8_t controlByte = GetReadControlByteFromSocket(socket);
    return ReadSingleByteW5500WithCntl(Sn_MR, controlByte);
}

void WriteSocketCommand(uint8_t socket, uint8_t value)
{
    SetSingleByteW5500WithCntl(Sn_CR ,value, GetWriteControlByteFromSocket(socket));
    
    while(ReadSocketCommand(socket)) {}
}

uint8_t ReadSocketCommand(uint8_t socket)
{
    return ReadSingleByteW5500WithCntl(Sn_CR, GetReadControlByteFromSocket(socket));
}

uint8_t ReadSocketStatus(uint8_t socket)
{
    return ReadSingleByteW5500WithCntl(Sn_SR, GetReadControlByteFromSocket(socket));
}

void WriteSocketTXPointer(uint8_t socket, uint16_t value)
{
    uint8_t dataPointer[2];
    dataPointer[0] = value >> 8;
    dataPointer[1] = value & 0xFF;
    WriteToW5500(Sn_TX_WR0, GetWriteControlByteFromSocket(socket), dataPointer, 2);
}

uint16_t ReadSocketTxPointer(uint8_t socket)
{
    uint8_t dataPointer[2];
    ReadFromW5500(Sn_TX_WR0, GetReadControlByteFromSocket(socket), dataPointer, 2);
    
    uint16_t retValue = dataPointer[0] << 8;
    retValue += dataPointer[1];
    
    return retValue;
}

void WriteSocketRXPointer(uint8_t socket, uint16_t value)
{
    uint8_t dataPointer[2];
    dataPointer[0] = value >> 8;
    dataPointer[1] = value & 0xFF;
    WriteToW5500(Sn_RX_RD0, GetWriteControlByteFromSocket(socket), dataPointer, 2);
}

uint16_t ReadSocketRxPointer(uint8_t socket)
{
    uint8_t dataPointer[2];
    ReadFromW5500(Sn_RX_RD0, GetReadControlByteFromSocket(socket), dataPointer, 2);
    
    uint16_t retValue = dataPointer[0] << 8;
    retValue += dataPointer[1];
    
    return retValue;
}

uint16_t ReadRecievedBufferSize(uint8_t socket)
{
    uint8_t dataPointer[2];
    ReadFromW5500(Sn_RX_RSR0, GetReadControlByteFromSocket(socket), dataPointer, 2);
    
    uint16_t retValue = dataPointer[0] << 8;
    retValue += dataPointer[1];
    
    return retValue;
}

void ConnectToIP(uint8_t* IP, uint8_t* port)
{
    uint16_t sourcePort = 1024;
    uint8_t srcPort[2];
    srcPort[0] = sourcePort >> 8;
    srcPort[1] = sourcePort & 0xFF;
    WriteSocketMode(0, Sn_MR_TCP);
    WriteSourcePort(0, srcPort);
    WriteSocketCommand(0, Sn_CR_OPEN);
    
    uint8_t socketMode = ReadSocketMode(0);
    uint8_t socketStatus = 0;
    WriteDestinationIP(0, IP);
    WriteDestinationPort(0, port);
    WriteSocketCommand(0, Sn_CR_CONNECT);
    
    do
    {
        socketStatus = ReadSocketStatus(0);
    }while(socketStatus != Sn_SR_ESTABLISHED);
}

void SendData(uint8_t* buf, uint16_t len)
{
    uint16_t pointer = 0;
    pointer = ReadSocketTxPointer(0);
    WriteToW5500(pointer, GetWriteControlByteFromSocketTx(0), buf, len);
    pointer += len;
    WriteSocketTXPointer(0, pointer);
    
    WriteSocketCommand(0, Sn_CR_SEND);
}

void Listen(uint16_t sourcePort)
{
    // currently assume socket 0
    uint8_t srcPort[2];
    srcPort[0] = sourcePort >> 8;
    srcPort[1] = sourcePort & 0xFF;
    WriteSocketMode(0, Sn_MR_TCP);
    WriteSourcePort(0, srcPort);
    WriteSocketCommand(0, Sn_CR_OPEN);
    
    WriteSocketCommand(0, Sn_CR_LISTEN);
}

uint16_t DataAvailable()
{
    uint16_t val=0,val1=0;
    do {
        val1 = ReadRecievedBufferSize(0);
        if (val1 != 0)
            val = ReadRecievedBufferSize(0);
    } 
    while (val != val1);
    return val;
}

void ReadData(uint8_t* buffer, uint16_t size)
{
    uint16_t dataInBuf = DataAvailable();
    
    if(dataInBuf > 0)
    {
        uint16_t rxPtr = 0;
        rxPtr = ReadSocketRxPointer(0);
        
        // Recv the data
        ReadFromW5500(rxPtr, GetReadControlByteFromSocketRx(0), buffer, size);
        rxPtr += size;
        WriteSocketRXPointer(0, rxPtr);
        
        rxPtr = ReadSocketRxPointer(0);
        
        WriteSocketCommand(0, Sn_CR_RECV);
        
        rxPtr = ReadSocketRxPointer(0);
    }
}

void FillBuf4(uint8_t* buf, uint8_t a, uint8_t b, uint8_t c, uint8_t d)
{
    buf[0] = a;
    buf[1] = b;
    buf[2] = c;
    buf[3] = d;
}

void FillBuf6(uint8_t* buf, uint8_t a, uint8_t b, uint8_t c, uint8_t d, uint8_t e, uint8_t f)
{
    buf[0] = a;
    buf[1] = b;
    buf[2] = c;
    buf[3] = d;
    buf[4] = e;
    buf[5] = f;
}

uint8_t TestW5500RegisterWriting()
{
    uint8_t writeSubBuff [4] = {255,255,255,0};
    FillBuf4(writeSubBuff, 255, 255, 255, 0);
    uint8_t readSubBuf [4];
    
    uint8_t writeMACBuf [6] = {0,1, 3, 5, 77, 9};
    FillBuf6(writeMACBuf, 0, 1, 3, 5, 77, 9);
    uint8_t readMACBuf[6];
    
    uint8_t writeSourceIPBuf [4] = {192,168,0,186};
    FillBuf4(writeSourceIPBuf, 192, 168, 0, 186);
    uint8_t readSourceIPBuf [4];
    
    uint8_t writeGatewayBuf [4] = {192,168,0,1};
    FillBuf4(writeGatewayBuf, 192, 168, 0, 1);
    uint8_t readGatewayBuf [4];
    
    uint8_t success = 0;
    uint8_t numTests = 0;
    
    WriteSubnetMask(writeSubBuff);
    ReadSubnetMask(readSubBuf);
    
    WriteMacAddress(writeMACBuf);
    ReadMacAddress(readMACBuf);
    
    WriteSourceIP(writeSourceIPBuf);
    ReadSourceIP(readSourceIPBuf);
    
    WriteDefaultGateway(writeGatewayBuf);
    ReadDefaultGateway(readGatewayBuf);
    
    success += AreBufsEqual(writeSubBuff, readSubBuf, 4);
    numTests++;
    success += AreBufsEqual(writeMACBuf, readMACBuf, 6);
    numTests++;
    success += AreBufsEqual(writeSourceIPBuf, readSourceIPBuf, 4);
    numTests++;
    success += AreBufsEqual(writeGatewayBuf, readGatewayBuf, 4);
    numTests++;
    
    if(numTests == success)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}