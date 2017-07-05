/// @description receive player data from server
var socketId = ds_map_find_value(async_load, "id");

if (socketId == clientSocket) {
	var receivedBuffer = ds_map_find_value(async_load, "buffer");
	buffer_seek(receivedBuffer, buffer_seek_start, 0);
	var type = buffer_read(receivedBuffer, buffer_string);
	
	if (type == "c") { //connection
		//do nothing
	} else if (connectedToServer) {
		if (type == "p") { //player
			otherX = buffer_read(receivedBuffer, buffer_u16);
			oneActivate = buffer_read(receivedBuffer, buffer_bool);
			otherY = buffer_read(receivedBuffer, buffer_u16);
			twoActivate = buffer_read(receivedBuffer, buffer_bool);
			otherMouseX = buffer_read(receivedBuffer, buffer_u16);
			threeActivate = buffer_read(receivedBuffer, buffer_bool);
			otherMouseY = buffer_read(receivedBuffer, buffer_u16);
			fourActivate = buffer_read(receivedBuffer, buffer_bool);
			otherSpriteIndex = buffer_read(receivedBuffer, buffer_string);
			otherImageIndex = buffer_read(receivedBuffer, buffer_u16);
			type = buffer_read(receivedBuffer, buffer_string);
		}
		
		if (type == "e") { //enda
			//do nothing
		} else if (type == "s") { //selectHero
			otherLockedIn = buffer_read(receivedBuffer, buffer_bool);
		}
		
		buffer_delete(receivedBuffer);
	}
}