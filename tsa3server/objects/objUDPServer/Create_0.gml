///@desc creation stuff
udp = network_create_socket_ext(network_socket_udp, udpPortNum);

if (udp < 0) {
	show_debug_message("server creation failed");
} else {
	show_debug_message("server successfully created");
}

bufferToSend = buffer_create(1024, buffer_grow, 1);