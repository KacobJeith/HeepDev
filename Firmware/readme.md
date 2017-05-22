# Firmware System

## Heep Status Register

* Bit 2 - Set to 1 to use locally indexed device IDs
* Bit 1 - 0 - Sets number of bytes to use for locally indexed IDs - 1

Example : 
0b00000100 -> Use Locally indexed IDs. 1 byte per ID
0b00000111 -> Use locally indexed IDs. 4 bytes per ID
0b00000101 -> Use locally indexed IDs. 2 bytes per ID
0b00000000 -> Do not use locally indexed IDs

## Wiring - ENC28-J60

| Signal | Arduino Uno Pin |
|:------:|:---------------:|
|   SI   |       11        |
|   SO   |       12        |
|   SCK  |       13        |
|   SS   |       10        |

For https://github.com/ntruchsess/arduino_uip
