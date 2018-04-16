///@desc creation stuff
//settings
portNum = 8125;
ipNum = "10.0.1.43";

//necessary vars
tcp = network_create_socket(network_socket_tcp);
network_connect(tcp, ipNum, portNum);
udp = network_create_socket(network_socket_udp);
bufferToSend = buffer_create(256, buffer_grow, 1);