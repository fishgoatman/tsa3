///@desc networking stuff
var receivedBuffer = async_load[? "buffer"];
var portNum = async_load[? "port"];

if (portNum == udpPortNum) {
	buffer_seek(receivedBuffer, buffer_seek_start, 0);
	var bufferType = buffer_read(receivedBuffer, buffer_string);
	show_debug_message(bufferType);

	if (bufferType == "basicState") {
		var playerNum = buffer_read(receivedBuffer, buffer_u16);
		var xPos = buffer_read(receivedBuffer, buffer_u16);
		show_debug_message(string(playerNum) + " " + string(xPos));
		//var yPos = buffer_read(receivedBuffer, buffer_u16);
		var playerDataId = ds_map_find_value(playerDataIds, playerNum);
		playerDataId.xPos = xPos;
		//playerDataId.yPos = yPos;
	}
}