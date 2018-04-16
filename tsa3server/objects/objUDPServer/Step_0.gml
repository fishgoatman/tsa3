///@desc send data
for (var g = 0; g < ds_list_size(currGameDataIds); g++) {
	var currGameDataId = ds_list_find_value(currGameDataIds, g);
	
	for (var c = 0; c < ds_list_size(currGameDataId.clientIds); c++) {
		var clientId = ds_list_find_value(currGameDataId.clientIds, c);
		var clientDataId = ds_map_find_value(clientDataIds, clientId);
		var clientIp = clientDataId.ip;
		
		for (var p = 0; p < ds_list_size(currGameDataId.playerNums); p++) {
			var playerNum = ds_list_find_value(currGameDataId.playerNums, p);
			var playerDataId = ds_map_find_value(playerDataIds, playerNum);
			var playerClientId = playerDataId.clientId;
			
			if (clientId != playerClientId) {
				scrSendPlayerData();
			}
		}
	}
}