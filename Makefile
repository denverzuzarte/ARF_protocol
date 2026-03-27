CC = avr-gcc
OC = avr-objcopy
MCU = atmega328p
F_CPU = 16000000UL
INC_FOL = /home/denver/c/ARF_protocol/includes 
NRF_FILES = includes/STDIO_UART.c includes/nrf24l01.c includes/spi.c
TARGET = main.hex
OBJECTS = STDIO_UART.o nrf24l01.o spi.o main.o
FLASHER = avrdude
BAUDRATE = 115200
SOURCE = main.c
INTERMEDIARY = main.elf
CHIP = arduino
USB_PORT = /dev/ttyUSB0
EEPROM = .eeprom
VPATH = $(INC_FOL)
CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os -I $(INC_FOL)  

.PHONY: all
all: $(TARGET)

.PHONY: flash
flash: $(TARGET)
	$(FLASHER) -p $(MCU) -c $(CHIP) -P $(USB_PORT) -b $(BAUDRATE) -U flash:w:$(TARGET) 

.PHONY: clean
clean:
	rm -f $(OBJECTS) $(INTERMEDIARY) $(TARGET)
	
$(TARGET): $(INTERMEDIARY)
	$(OC) -O ihex -R $(EEPROM) $< $@

$(INTERMEDIARY): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
