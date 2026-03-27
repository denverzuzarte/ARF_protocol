This project is for The course PH222 - 2025-2026 spring semester

I intend to demonstrate 2 way encrypted communication with the restriction of 32 KB memory and 2KB RAM

The Handshake step uses an RSA based encryption to set up a handshake, and uses a faster XOR based symmetric encryption for faster 2 way communication.


[link to blink tutorial for baremetal arduino] (https://www.youtube.com/watch?v=j4xw8QomkXs)

now one small complication that has come up is that 2 of my arduinos are CH340 models while one of the is a FT232 and hence have different baud rates for code upload :(
by bash script will be modified to find an arduino on a given /dev/ttyUSBn find the params needed to compile it and depending on the type of arduino it is supposed to act as will upload the different compiled hex codes


we are using code from the project - https://github.com/thehelvijs/nRF24L01-avr-bareminimum.git
for writing instructions to the nrf module

 


