///@desc step

///matchmaking
if (ds_list_size(inQueuePlayerNums) >= 2) {
	var currGameDataId = instance_create_depth(0, 0, 0, objData);
	var firstNum = ds_list_find_value(inQueuePlayerNums, 0);
	var secondNum = ds_list_find_value(inQueuePlayerNums, 1);
	currGameDataId.playerNums[0] = firstNum;
	currGameDataId.playerNums[1] = secondNum;
	var firstClientId = ds_map_find_value(playerDataIds, firstNum).clientId;
	var firstClientDataId = ds_map_find_value(clientDataIds, firstClientId);
	currGameDataId.clientIds[0] = firstClientId;
	firstClientDataId.gameDataId = currGameDataId;
	var secondClientId = ds_map_find_value(playerDataIds, secondNum).clientId;
	var secondClientDataId = ds_map_find_value(clientDataIds, secondClientId);
	
	if (secondClientId != firstClientId) {
		currGameDataId.clientIds[1] = secondClientId;
		secondClientDataId.gameDataId = currGameDataId;
	}
	
	ds_list_add(currGameDataIds, currGameDataId);
	ds_list_delete(inQueuePlayerNums, 0);
	ds_list_delete(inQueuePlayerNums, 1);
	
	//sending thisNumber
	for (var c = 0; c < array_length_1d(currGameDataId.clientIds); c++) {
		var currClientId = currGameDataId.clientIds[c];
		
		for (var p = 0; p < array_length_1d(currGameDataId.playerNums); p++) {
			var thisPlayerNum = currGameDataId.playerNums[p];
			var playerClientId = ds_map_find_value(playerDataIds, thisPlayerNum).clientId;
			
			if (currClientId == playerClientId) {
				buffer_seek(bufferToSend, buffer_seek_start, 0);
				buffer_write(bufferToSend, buffer_string, "thisNumber");
				//buffer_write(bufferToSend, buffer_u8, p);
				buffer_write(bufferToSend, buffer_u16, thisPlayerNum);
				network_send_packet(currClientId, bufferToSend, buffer_tell(bufferToSend));
				show_debug_message("thisNumber" + string(buffer_tell(bufferToSend)));
			}
		}
	}
}