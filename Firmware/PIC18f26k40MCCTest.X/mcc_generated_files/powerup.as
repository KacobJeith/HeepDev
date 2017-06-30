 ;
;
; From Errata document DS80000713A for the PIC168F27K40
;
#include <xc.inc>

global    powerup,start
psect    powerup,class=CODE,delta=1,reloc=2
    
powerup:
    bsf NVMCON1, 7;  From errata document DS80000713A
    ;nop    ; Suggested Microchip errata workaround
    goto    start
    end