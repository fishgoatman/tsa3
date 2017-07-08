/// @description correct arrow time
var socketId = ds_map_find_value(async_load, "id");

if (socketId == clientSocket) {
	var receivedBuffer = ds_map_find_value(async_load, "buffer");
	
	if (buffer_exists(receivedBuffer)) {
		buffer_seek(receivedBuffer, buffer_seek_start, 0);
		var type = buffer_read(receivedBuffer, buffer_string);
	
		if (type == "a") {
			timeLeftForArrows = buffer_read(receivedBuffer, buffer_u16);
		}
	}
}