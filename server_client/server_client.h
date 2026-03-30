#include <stdint.h>

typedef struct{
	uint32_t n;
	uint32_t e;
} PublicKey;

typedef struct{
	uint32_t session_key;
	//will fill later
}SessionReq

typedef struct{
	char *enc_msg[4];
	uint64_t req_addr;
	bool isSending;
} MsgPacket;
