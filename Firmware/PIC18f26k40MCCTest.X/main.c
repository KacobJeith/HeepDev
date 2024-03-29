#define ON_PIC
#define DHCP

#include "mcc_generated_files/mcc.h"
#include "../PICHeepLibrary/PICIncludes.h"
#include "../ServerlessFirmware/Heep_API.h"

void BlinkLights()
{
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
}

void SetHeepCommFunctions()
{
    Heep_Millis = millis;
    Get_DHCP_Time_Millis = millis;
    HEEP_SPI_Exchange_Byte = SPI1_Exchange8bit;
    WIZCHIP.IF.SPI._write_byte = WritePICByte;
    WIZCHIP.IF.SPI._read_byte = ReadPICByte;
    WIZCHIP.CS._select = SetW5500SS;
    WIZCHIP.CS._deselect = ResetW5500SS;
}

void RunMCCBoilerPlate()
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
}

void main(void)
{
    RunMCCBoilerPlate();
    SetHeepCommFunctions();
    
    PinMode(0, output);
    PinMode(1, output);
    DigitalWrite(1, high);
    DigitalWrite(0, high);
    
    BlinkLights();
    
    InitializeW5500();
    
#ifdef DHCP
    
    uint8_t myMAC [6] = {0, 2, 3, 4, 7, 6};
    setSHAR(myMAC);
    
    Start_Heep_With_DHCP ();
    
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
  
}