#define ON_PIC
#define USE_HEEP
#define DHCP

#include "mcc_generated_files/mcc.h"
#include "W5500.h"
#include "DigitalIO.h"
#include "ioLibrary_Driver-master/Ethernet/socket.h"
#include "ioLibrary_Driver-master/Internet/DHCP/dhcp.h"
#include "../ServerlessFirmware/Heep_API.h"

#define TEST_SERVER


void TestEEPROM()
{
     
}

void WritePICByte(uint8_t byte)
{
    SPI1_Exchange8bit(byte);
}

uint8_t ReadPICByte()
{
    uint8_t readByte = SPI1_Exchange8bit(0);
    return readByte;
}

void delay(uint32_t theTime)
{
    uint32_t startTime = millis();
    uint32_t endTime = startTime + theTime;
    
    while(millis() < endTime) {}
}

void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();

    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global and Peripheral Interrupts
    // Use the following macros to:

    // Enable high priority global interrupts
    //INTERRUPT_GlobalInterruptHighEnable();

    // Enable low priority global interrupts.
    //INTERRUPT_GlobalInterruptLowEnable();

    // Disable high priority global interrupts
    //INTERRUPT_GlobalInterruptHighDisable();

    // Disable low priority global interrupts.
    //INTERRUPT_GlobalInterruptLowDisable();

    // Enable the Global Interrupts
    INTERRUPT_GlobalInterruptEnable();

    // Enable the Peripheral Interrupts
    INTERRUPT_PeripheralInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();

    PinMode(0, output);
    PinMode(1, output);
    DigitalWrite(1, high);
    DigitalWrite(0, high);
    
    uint32_t lastTime = 0;
    uint32_t interval = 1000;
    uint8_t lightState = 0;
    
    DigitalWrite(0, high);
    delay(200);
    DigitalWrite(0, low);
    delay(200);
    DigitalWrite(0, high);
    delay(200);
    DigitalWrite(0, low);
    delay(200);
    DigitalWrite(0, high);
    delay(200);
    DigitalWrite(0, low);
    
    delay(500);
    
    InitializeW5500();
    
    WIZCHIP.IF.SPI._write_byte = WritePICByte;
    WIZCHIP.IF.SPI._read_byte = ReadPICByte;
    WIZCHIP.CS._select = SetW5500SS;
    WIZCHIP.CS._deselect = ResetW5500SS;
        
    
#ifdef DHCP
    
    uint8_t myMAC [6] = {0, 2, 3, 4, 7, 6};
    setSHAR(myMAC);

    uint8_t dhcpBuf[200];
    DHCP_init(0, dhcpBuf);
      
    while(1)
    {
        if(GetMillis() - lastTime > interval)
        {
            lastTime = GetMillis();
            
            if(lightState)
            {
                lightState = 0;
            }
            else
            {
                lightState = 1;
            }
            
            //DigitalWrite(0, lightState);
            DHCP_time_handler();
        }
        
        uint8_t dhcpUserState = DHCP_run();

        if(dhcpUserState == DHCP_IP_LEASED)
        {
            break;
        }
    }
    
#else
    
    
    uint8_t myMAC [6] = {0, 2, 3, 4, 7, 6};
    uint8_t mySub [4] = {255, 255, 255, 0};
    uint8_t myIP [4] = {192, 168, 0, 186};
    uint8_t myGateway[4] = {192, 168, 0, 1};
    
    setSUBR(mySub);
    setSHAR(myMAC);
    setSIPR(myIP);
    setGAR(myGateway);
    
#endif
    
    
    DigitalWrite(0, 0);
    
    
#ifndef USE_HEEP
    
    uint8_t destIP [4] = {192, 168, 0, 110};
    uint8_t recvBuf[200];
    interval = 500;
    socket(1, Sn_MR_TCP, 5000, 0);
    
#ifdef TEST_SERVER
    listen(1);
#endif
    
    while(1)
    {
        
        if(millis() - lastTime > interval)
        {
            lastTime = millis();
            
            if(lightState)
            {
                lightState = 0;
            }
            else
            {
                lightState = 1;
            }
            
            //DigitalWrite(0, lightState);
            
#ifndef TEST_SERVER
            connect(1, destIP, 5000);
            uint8_t sendBuf [7] = {'W', 'e', 'l', 'c', 'o', 'm', 'e'};
            send(1, sendBuf, 7);
            uint16_t curData = DataAvailable(1);
            if(curData > 0)
            {
                recv(1, recvBuf, curData);
            }
            close(1);
            socket(1, Sn_MR_TCP, 5000, 0);
#endif
            
        }
        
#ifdef TEST_SERVER
        uint16_t curData = DataAvailable(1);
        if(curData > 0)
        {
            recv(1, recvBuf, curData);
            
            uint8_t sendBuf [7] = {'W', 'e', 'l', 'c', 'o', 'm', 'e'};
            send(1, sendBuf, 7);
            
            socket(1, Sn_MR_TCP, 5000, 0);
            listen(1);
        }
#endif
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
#else
    
    char deviceName [] = "Flap";

    char controlName0 [] = "Log";
    struct Control control0;

    char controlName1 [] = "Tor";
    struct Control control1;    
    
    deviceIDByte[0] = 0x34;
    deviceIDByte[1] = 0x12;
    deviceIDByte[2] = 0x05;
    deviceIDByte[3] = 0x01;
    
    SetupHeepDevice(deviceName);
	control0.controlName = controlName0;
	control0.controlID = 0;
	control0.controlDirection = 0;
	control0.controlType = 0;
	control0.highValue = 1;
	control0.lowValue = 0;
	control0.curValue = 0;
	AddControl(control0);

	control1.controlName = controlName1;
	control1.controlID = 1;
	control1.controlDirection = 1;
	control1.controlType = 1;
	control1.highValue = 100;
	control1.lowValue = 0;
	control1.curValue = 0;
	AddControl(control1);

	SetupHeepTasks();
	CreateInterruptServer();
    
    while(1)
    {
        PerformHeepTasks();
        
        DigitalWrite(0, controlList[0].curValue);
    }
  
    
#endif
}