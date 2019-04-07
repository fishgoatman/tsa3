///@desc step
///matchmaking
if (ds_list_size(inQueuePlayerServerNums) >= 2) {
	var currGameDataId = instance_create_depth(0, 0, 0, objGameData);
	var firstServerNum = ds_list_find_value(inQueuePlayerServerNums, 0);
	var secondServerNum = ds_list_find_value(inQueuePlayerServerNums, 1);
	currGameDataId.playerServerNums[0] = firstServerNum;
	currGameDataId.playerServerNums[1] = secondServerNum;
	var firstClientId = ds_map_find_value(playerDataIds, firstServerNum).clientId;
	var firstClientDataId = ds_map_find_value(clientDataIds, firstClientId);
	currGameDataId.clientIds[0] = firstClientId;
	firstClientDataId.gameDataId = currGameDataId;
	var secondClientId = ds_map_find_value(playerDataIds, secondServerNum).clientId;
	
	if (secondClientId != firstClientId) {
		currGameDataId.clientIds[1] = secondClientId
		var secondClientDataId = ds_map_find_value(clientDataIds, secondClientId)
		secondClientDataId.gameDataId = currGameDataId
	}
	
	for (var p = 0; p < array_length_1d(currGameDataId.playerServerNums); p++) {
		currGameDataId.sentThisNumber[p] = false;
	}
	
	ds_list_add(currGameDataIds, currGameDataId);
	ds_list_delete(inQueuePlayerServerNums, 0);
	ds_list_delete(inQueuePlayerServerNums, 1);
	
	//sending thisNumber
	for (var c = 0; c < array_length_1d(currGameDataId.clientIds); c++) {
		var currClientId = currGameDataId.clientIds[c];
		
		for (var p = 0; p < array_length_1d(currGameDataId.playerServerNums); p++) {
			var thisPlayerNum = currGameDataId.playerServerNums[p];
			var playerClientId = ds_map_find_value(playerDataIds, thisPlayerNum).clientId;
			
			if (!currGameDataId.sentThisNumber[p] && currClientId == playerClientId) {
				buffer_seek(bufferToSend, buffer_seek_start, 0);
				buffer_write(bufferToSend, buffer_u8, THIS_NUMBER);
				buffer_write(bufferToSend, buffer_u8, p);
				buffer_write(bufferToSend, buffer_u16, thisPlayerNum);
				network_send_packet(currClientId, bufferToSend, buffer_tell(bufferToSend));
				currGameDataId.sentThisNumber[p] = true;
			}
		}
	}
}