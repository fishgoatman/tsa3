///@desc creation stuff
//settings
portNum = 8125;
ipNum = "127.0.0.1";

//necessary vars
tcp = network_create_socket(network_socket_tcp);
network_connect(tcp, ipNum, portNum);
bufferToSend = buffer_create(256, buffer_grow, 1);