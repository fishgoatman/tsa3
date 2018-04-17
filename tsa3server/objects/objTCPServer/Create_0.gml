///@desc creation stuff
//settings
globalvar tcpPortNum;
tcpPortNum = 8125;
globalvar udpPortNum;
udpPortNum = 8126;
maxClients = 32;

//necessary vars
tcp = network_create_server(network_socket_tcp, tcpPortNum, maxClients);
bufferToSend = scrCreateBuffer();
numConnected = 5;

globalvar clientIds, clientDataIds, playerDataIds, inQueuePlayerNums, currGameDataIds;
clientIds = ds_list_create();
clientDataIds = ds_map_create();
playerDataIds = ds_map_create();
inQueuePlayerNums = ds_list_create();
currGameDataIds = ds_list_create();