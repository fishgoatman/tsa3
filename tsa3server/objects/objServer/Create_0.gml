/// @description create the server
PORT_NUM = 54795;
serverSocket = network_create_socket_ext(network_socket_udp, PORT_NUM);

if (serverSocket < 0) {
	show_debug_message("server creation failed");
} else {
	show_debug_message("server successfully created");
}

ipList = ds_list_create();
portList = ds_list_create();
ip = "0.0.0.0";
port = 0;
buffer = buffer_create(256, buffer_fixed, 1);