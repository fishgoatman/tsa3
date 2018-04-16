///@desc creation stuff
udp = network_create_socket_ext(network_socket_udp, portNum);
bufferToSend = buffer_create(256, buffer_grow, 1);