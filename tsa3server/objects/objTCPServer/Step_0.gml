///@desc step

///matchmaking
if (ds_list_size(inQueuePlayerNums) >= 2) {
	var currGameDataId = instance_create_depth(0, 0, 0, objData);
	var firstNum = ds_list_find_value(inQueuePlayerNums, 0);
	var secondNum = ds_list_find_value(inQueuePlayerNums, 1);
	currGameDataId.playerNums[0] = firstNum;
	currGameDataId.playerNums[1] = secondNum;
	var firstClientId = ds_map_find_value(playerDataIds, firstNum).clientId;
	currGameDataId.clientIds[0] = firstClientId;
	var secondClientId = ds_map_find_value(playerDataIds, secondNum).clientId;
	
	if (secondClientId != firstClientId) {
		currGameDataId.clientIds[1] = secondClientId;
	}
	
	ds_list_add(currGameDataIds, currGameDataId);
	ds_list_delete(inQueuePlayerNums, 0);
	ds_list_delete(inQueuePlayerNums, 1);
	
	for (var c = 0; c < array_length_1d(currGameDataId.clientIds); c++) {
		var currClientId = currGameDataId.clientIds[c];
		
		for (var p = 0; p < array_length_1d(currGameDataId.playerNums); p++) {
			var thisPlayerNum = currGameDataId.playerNums[p];
			var playerClientId = ds_map_find_value(playerDataIds, thisPlayerNum).clientId;
			
			if (currClientId == playerClientId) {
				buffer_seek(bufferToSend, buffer_seek_start, 0);
				buffer_write(bufferToSend, buffer_string, "thisNumber");
				buffer_write(bufferToSend, buffer_u8, p);
				network_send_packet(currClientId, bufferToSend, buffer_tell(bufferToSend));
			}
		}
	}
}