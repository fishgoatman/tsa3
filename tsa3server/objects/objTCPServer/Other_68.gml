///@desc networking stuff
var type = async_load[? "type"];
var portNum = async_load[? "port"];

if (portNum == tcpPortNum) {
	if (type == network_type_connect) {
		var clientId = async_load[? "socket"];
		var ip = async_load[? "ip"];
		ds_list_add(clientIds, clientId);
		var clientDataId = instance_create_depth(0, 0, 0, objClientData);
		clientDataId.ip = ip;
		clientDataId.udpPortNum = portNum;
		ds_map_add(clientDataIds, clientId, clientDataId);
		buffer_seek(bufferToSend, buffer_seek_start, 0);
		buffer_write(bufferToSend, buffer_u8, TCP_CONNECTION);
		network_send_packet(clientId, bufferToSend, buffer_tell(bufferToSend));
		show_debug_message("currTime = " + string(current_time));
	} else if (type == network_type_disconnect) {
		var clientId = async_load[? "socket"];
		for (var i = 0; i < ds_list_size(listIds); i++) {
			var listId = ds_list_find_value(listIds, i);
			var index = ds_list_find_index(listId, clientId);
	
			if (index != -1) {
				ds_list_delete(listId, index);
			}
		}
	} else if (type == network_type_data) {
		var clientId = async_load[? "id"];
		var receivedBuffer = async_load[? "buffer"];
		buffer_seek(receivedBuffer, buffer_seek_start, 0);
		var bufferType = buffer_read(receivedBuffer, buffer_u8);
	
		if (bufferType == NUM_PLAYERS) {
			var numNewPlayers = buffer_read(receivedBuffer, buffer_u8);
			var clientDataId = ds_map_find_value(clientDataIds, clientId);
		
			for (var i = 0; i < numNewPlayers; i++) {
				var playerNum = numConnected;
				numConnected++;
				var playerDataId = instance_create_depth(0, 0, 0, objPlayerData);
				playerDataId.clientId = clientId;
				ds_list_add(clientDataId.playerNums, playerNum);
				ds_map_add(playerDataIds, playerNum, playerDataId);
				ds_list_add(inQueuePlayerNums, playerNum);
			}
		} else if (bufferType == DELAY_TEST) {
			var testNum = buffer_read(receivedBuffer, buffer_u8);
			buffer_seek(bufferToSend, buffer_seek_start, 0);
			buffer_write(bufferToSend, buffer_u8, DELAY_TEST);
			buffer_write(bufferToSend, buffer_u8, testNum);
			buffer_write(bufferToSend, buffer_f32, current_time);
			network_send_packet(clientId, bufferToSend, buffer_tell(bufferToSend));
		}
	}
}