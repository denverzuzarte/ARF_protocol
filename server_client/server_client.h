#include <stdint.h>

typedef struct{
	uint32_t n;
	uint32_t e;
} PublicKey

typedef 

typedef struct{
	char *enc_msg[4];
	uint64_t req_addr;
	bool isSending;
} Packet;

typedef struct node{
	Packet message;
	node *next;
} Node;


