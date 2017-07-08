/// @description receive player data from server
var socketId = ds_map_find_value(async_load, "id");

if (socketId == clientSocket) {
	receivedBuffer = ds_map_find_value(async_load, "buffer");
	buffer_seek(receivedBuffer, buffer_seek_start, 0);
	var type = buffer_read(receivedBuffer, buffer_string);
	
	if (type == "c") { //connection
		//do nothing
	} else if (connectedToServer) {
		if (type == "p") { //player
			otherX = buffer_read(receivedBuffer, buffer_f32);
			otherOneActivate = buffer_read(receivedBuffer, buffer_bool);
			otherY = buffer_read(receivedBuffer, buffer_f32);
			otherTwoActivate = buffer_read(receivedBuffer, buffer_bool);
			otherMouseX = buffer_read(receivedBuffer, buffer_f32);
			otherThreeActivate = buffer_read(receivedBuffer, buffer_bool);
			otherMouseY = buffer_read(receivedBuffer, buffer_f32);
			otherFourActivate = buffer_read(receivedBuffer, buffer_bool);
			otherSpriteIndex = buffer_read(receivedBuffer, buffer_string);
			otherImageIndex = buffer_read(receivedBuffer, buffer_u16);
			otherHp = buffer_read(receivedBuffer, buffer_u16);
			otherXScale = buffer_read(receivedBuffer, buffer_s8);
			otherDucking = buffer_read(receivedBuffer, buffer_bool);
			type = buffer_read(receivedBuffer, buffer_string);
		}
		
		if (type == "e") { //enda
			//do nothing
		} else if (type == "s") { //selectHero
			otherLockedIn = buffer_read(receivedBuffer, buffer_bool);
			otherPlayerHero = buffer_read(receivedBuffer, buffer_string);
		}
	}
}