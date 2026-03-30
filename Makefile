CC = avr-gcc
OC = avr-objcopy
MCU = atmega328p
F_CPU = 16000000UL
INC_FOL = includes:server_client
NRF_FILES = includes/STDIO_UART.c includes/nrf24l01.c includes/spi.c
TARGET = blink_test.hex
OBJECTS = blink_test.o
FLASHER = avrdude
BAUDRATE = 115200
SOURCE = server_client/blink_test.c
INTERMEDIARY = blink_test.elf
CHIP = arduino
USB_PORT = /dev/ttyACM0
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
