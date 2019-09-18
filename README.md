This is barebones can messages between to stm32l432's to trigger blinking lights

### Getting started:
1. Install Python if you dont have it
2. Intall mbed-cli if you don't have it
```sh
$ pip install mbed-cli 
```
3. To get the mbed libraries run this command in the root folder
```sh
$ mbed deploy
```
3. Install the required packages if you dont have them  (recommend to use a virtualenv), requirements.txt is located in \mbed-os
```sh
$ pip install -r requirements.txt
```
7. Build
```sh
$ mbed compile
```
8. drag .bin file into the microcontroller(⁨..\mbedStm32⁩\BUILD⁩\NUCLEO_L432KC⁩\GCC_ARM\mbedStm32.bin)
