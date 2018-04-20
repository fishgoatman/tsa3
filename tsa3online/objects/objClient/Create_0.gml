///@desc creation stuff
//settings
tcpPortNum = 8125;
udpPortNum = 8126;
ipNum = "10.0.1.43";

//necessary vars
tcp = network_create_socket(network_socket_tcp);
network_connect(tcp, ipNum, tcpPortNum);
udp = network_create_socket(network_socket_udp);
bufferToSend = scrCreateBuffer();
udpConnected = false;
tcpConnected = false;
clientServerDelay = 0;
maxTestNum = 10;
currTestNum = 0;
numReceivedTests = 0;
sentTimes[0] = 0;
serverTimes[0] = 0;
receivedTimes[0] = 0;
totalDelay = 0;
calculatedDelay = false;