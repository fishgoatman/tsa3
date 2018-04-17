///@desc creation stuff
//settings
tcpPortNum = 8125;
udpPortNum = 8126;
ipNum = "10.0.1.43";

//necessary vars
tcp = network_create_socket(network_socket_tcp);
network_connect(tcp, ipNum, tcpPortNum);
udp = network_create_socket(network_socket_udp);
bufferToSend = buffer_create(1024, buffer_grow, 1);