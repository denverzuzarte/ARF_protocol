#include <stdint.h>
#inlcude "server_client.h"
#include "session_utils.h"

void session_maintainer(bool session, char *xor_key)
{
	while(session)
	{
		bool packet_in_queue = msg_req();
		if(packet_in_queue)
		{
			Packet p = read_queue();
char
