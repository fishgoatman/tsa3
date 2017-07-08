/// @description receiving data from a client
ip = string(ds_map_find_value(async_load, "ip"));
port = ds_map_find_value(async_load, "port");
buffer = ds_map_find_value(async_load, "buffer");
var type = buffer_read(buffer, buffer_string);

if (type == "c") { //connection
	if (ds_list_find_index(ipList, ip) == -1) {
		ds_list_add(ipList, ip);
		ds_list_add(portList, port);
		show_debug_message("client connected");
	}
	
	buffer_seek(bufferToSend, buffer_seek_start, 0);
	buffer_write(bufferToSend, buffer_string, "c"); //connection confirm
	network_send_udp(serverSocket, ip, port, bufferToSend, buffer_tell(bufferToSend));
	buffer_delete(bufferToSend);
} else if (type == "o") { //one player
	if (ds_list_size(ipList) % 2 == 0) {
		var index = ds_list_find_index(ipList, ip);
		
		if (index % 2 == 0) {
			ipToSendTo = ds_list_find_value(ipList, index + 1);
			portToSendTo = ds_list_find_value(portList, index + 1);
			
			var bt = buffer_tell(buffer);
			var size = buffer_get_size(buffer);
			var tBuffer = buffer_create(size - bt, buffer_fixed, 1);
			buffer_copy(buffer, bt, size - bt, tBuffer, 0);
			network_send_udp(serverSocket, ipToSendTo, portToSendTo, tBuffer, buffer_get_size(tBuffer));
		}
	}
} else { //data
	if (ds_list_size(ipList) % 2 == 0) {
		var index = ds_list_find_index(ipList, ip);
		var ipToSendTo;
		var portToSendTo;
	
		if (index % 2 == 0) {
			ipToSendTo = ds_list_find_value(ipList, index + 1);
			portToSendTo = ds_list_find_value(portList, index + 1);
		} else {
			ipToSendTo = ds_list_find_value(ipList, index - 1);
			portToSendTo = ds_list_find_value(portList, index - 1);
		}
		
		network_send_udp(serverSocket, ipToSendTo, portToSendTo, buffer, buffer_get_size(buffer));
	}
}