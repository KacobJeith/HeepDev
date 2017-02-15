# Heep OS Dependent Example Devices

The examples found in this folder are written in Python and intended to be run on computers with an operating system. Most of these examples have been designed for usage particularly on the Raspberry Pi.

## Blinky

This the first Heep device ever created. Blinky receives a binary input and sends a signal to pin 17 on a Raspberry Pi. When not used on a Raspberry Pi, Blinky will just report the state of an imaginary light.

### Device Info

* Name: BlinkyLED
* ID: 444

### Controls

* LEDState
	* Direction: Input
	* Type: OnOff





## Button

This is the second Heep device ever created. Button sends a single binary output. When used on a Raspberry Pi, button looks for pin 12 as an input

### Device Info

* Name: Button
* ID: 001

### Controls

* ButtonOut
	* Direction: Output
	* Type: OnOff




## CuckooClock

Cuckoo Clock is a simple device that has a binary output that changes state every second. This can be used to flash lights, make nutcrackers chomp, etc...

### Device Info

* Name: CuckooConductor
* ID: 1175278

### Controls

* Tock
	* Direction: Output
	* Type: OnOff




## Egg

Egg is a servo controller that receives a single binary input to change the swing of a servo. Egg controls the Heep nutcracker robots

### Device Info

* Name: SenorEgg
* ID: 10245

### Controls

* Yolk
	* Direction: Input
	* Type: OnOff

## HueClient

This is a quick wrapper for controlling 2 hue light bulbs. This is currently specifically for Dylan's house, but can be easily modified.

### Device Info

* Name: HueBulbs
* ID: 5123085

### Controls

* HueLight1
	* Direction: Input
	* Type: OnOff

* HueLight2
	* Direction: Input
	* Type: OnOff