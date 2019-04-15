///@desc creation stuff
//settings
tcpPortNum = 8125
udpPortNum = 8126
ipNum = "73.189.41.182"
//ipNum = "10.0.1.43"
maxTimeSinceLast = 1

//necessary vars
tcp = network_create_socket(network_socket_tcp)
network_connect(tcp, ipNum, tcpPortNum)
udp = network_create_socket(network_socket_udp)
bufferToSend = scrCreateBuffer()
udpConnected = false
tcpConnected = false
sentTimes = ds_list_create()
receivedTimes = ds_list_create()
serverTimes = ds_list_create()
executedAbilitySentNums = ds_list_create()
abilitySentNum = 0
currTimeSinceLast = 0
ping = 0
delay = 0
initialDelay[0] = 0
initialDelay[1] = 0
pingInBwn = 6
pingInBwnCounter = 0
pingKeepNum = 10

TCP_CONNECTION = 0
THIS_NUMBER = 1
PING_TEST = 2
NUM_PLAYERS = 3
UDP_CONNECTION = 4
BASIC_STATE = 5
LOCKED_IN = 6
ABILITY = 7
LOB = 8
BALL = 9