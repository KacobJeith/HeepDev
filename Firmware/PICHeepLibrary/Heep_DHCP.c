#include "Heep_DHCP.h"
#include "ioLibrary_Driver-master/Internet/DHCP/dhcp.h"

void Start_Heep_With_DHCP (void)
{
    uint32_t lastTime = 0;
    uint32_t interval = 1000;
    
    uint8_t dhcpBuf[100];
    DHCP_init(0, dhcpBuf);
      
    while(1)
    {
        if(Get_DHCP_Time_Millis() - lastTime > interval)
        {
            lastTime = Get_DHCP_Time_Millis();
                    
            //DigitalWrite(0, lightState);
            DHCP_time_handler();
        }
        
        uint8_t dhcpUserState = DHCP_run();

        if(dhcpUserState == DHCP_IP_LEASED)
        {
            break;
        }
    }
}