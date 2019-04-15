///@desc creation stuff
udp = network_create_socket_ext(network_socket_udp, udpPortNum);

if (udp < 0) {
	show_debug_message("server creation failed");
} else {
	show_debug_message("server successfully created");
}

bufferToSend = scrCreateBuffer()

UDP_CONNECTION = 4
BASIC_STATE = 5
LOCKED_IN = 6
ABILITY = 7
LOB = 8
BALL = 9