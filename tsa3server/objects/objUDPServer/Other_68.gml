///@desc networking stuff
var portNum = async_load[? "port"];

if (portNum != udpPortNum && portNum != tcpPortNum) {
	var receivedBuffer = async_load[? "buffer"];
	var bufferType = buffer_read(receivedBuffer, buffer_string);
	show_debug_message(bufferType);

	if (bufferType == "basicState") {
		var playerNum = buffer_read(receivedBuffer, buffer_u16);
		show_debug_message("pn" + playerNum);
		var playerDataId = ds_map_find_value(playerDataIds, playerNum);
		playerDataId.xPos = xPos;
		playerDataId.yPos = yPos;
	}
}