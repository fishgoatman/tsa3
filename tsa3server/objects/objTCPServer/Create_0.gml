///@desc creation stuff
//settings
globalvar tcpPortNum;
tcpPortNum = 8127;
globalvar udpPortNum;
udpPortNum = 8128;
maxClients = 32;

//necessary vars
tcp = network_create_server(network_socket_tcp, tcpPortNum, maxClients);
bufferToSend = buffer_create(256, buffer_grow, 1);
numConnected = 0;

globalvar clientIds, clientDataIds, playerDataIds, inQueuePlayerNums, currGameDataIds;
clientIds = ds_list_create();
clientDataIds = ds_map_create();
playerDataIds = ds_map_create();
inQueuePlayerNums = ds_list_create();
currGameDataIds = ds_list_create();