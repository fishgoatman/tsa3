///@desc networking stuff
var portNum = async_load[? "port"];

if (portNum == udpPortNum) {
	var receivedBuffer = async_load[? "buffer"];
	//buffer_seek(receivedBuffer, buffer_seek_start, 0);
	var bufferType = buffer_read(receivedBuffer, buffer_string);
	show_debug_message(bufferType);

	if (bufferType == "basicState") {
		var playerNum = buffer_read(receivedBuffer, buffer_string);
		show_debug_message("pn" + playerNum);
		var xPos = buffer_read(receivedBuffer, buffer_u8);
		show_debug_message("xp" + string(xPos));
		var yPos = buffer_read(receivedBuffer, buffer_u8);
		show_debug_message("yp" + string(yPos));
		var playerDataId = ds_map_find_value(playerDataIds, playerNum);
		playerDataId.xPos = xPos;
		playerDataId.yPos = yPos;
	}
}