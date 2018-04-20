///@desc creation stuff
//settings
tcpPortNum = 8125;
udpPortNum = 8126;
ipNum = "98.210.161.45";
//ipNum = "10.0.1.43";
maxTimeSinceLast = 2;

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
currTimeSinceLast = 0;

TCP_CONNECTION = 0;
THIS_NUMBER = 1;
DELAY_TEST = 2;
NUM_PLAYERS = 3;
UDP_CONNECTION = 4;
BASIC_STATE = 5;
LOCKED_IN = 6;
ABILITY = 7;