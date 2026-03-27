#include <stdint.h>
#include "client_utils.h"
#include <stdlib.h>


uint16_t rsa_encrypt_key(uint32_t n, uint32_t e, char xor_key[])
{
	//xor_key is 4 bytes or 4 chars
	
}

char *xor_key_gen(char seed):
{
	char xor_key[4];
	srand(seed) //generation of a psuedo random number
	int random_int = rand();
	xor_key[0] = (random_int) & 0x000000FF;
	xor_key[1] = (random_int >> 8) & 0x000000FF;
	xor_key[2] = (random_int >> 16) & 0x000000FF;
	xor_key[3] = (random_int >> 24) & 0x000000FF;

	return xor_key;
}
