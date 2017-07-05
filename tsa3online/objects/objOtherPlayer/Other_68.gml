/// @description receive player data from server
var socketId = ds_map_find_value(async_load, "id");

if (socketId == clientSocket) {
	var receivedBuffer = ds_map_find_value(async_load, "buffer");
	buffer_seek(receivedBuffer, buffer_seek_start, 0);
	var type = buffer_read(receivedBuffer, buffer_string);
	
	if (type == "c") {
		//do nothing
	} else {
		buffer_read(receivedBuffer, buffer_u16); //divider
		
		if (type == "p") {
			buffer_read(receivedBuffer, buffer_string);
			var newX = buffer_read(receivedBuffer, buffer_u16);
			buffer_read(receivedBuffer, buffer_string);
			var newY = buffer_read(receivedBuffer, buffer_u16);
			show_debug_message("newX = " + string(newX) + " and newY = " + string(newY));
			opId.x = newX;
			opId.y = newY;
		}
	}
}