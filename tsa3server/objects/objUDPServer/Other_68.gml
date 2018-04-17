///@desc networking stuff
var portNum = async_load[? "port"];

if (portNum != udpPortNum && portNum != tcpPortNum) {
	var receivedBuffer = async_load[? "buffer"];
	buffer_seek(receivedBuffer, buffer_seek_start, 0);
	var bufferType = buffer_read(receivedBuffer, buffer_string);

	if (bufferType == "udpConnection") {
		var playerNum = buffer_read(receivedBuffer, buffer_u16);
		show_debug_message(playerNum);
		var playerDataId = ds_map_find_value(playerDataIds, playerNum);
		var clientDataId = ds_map_find_value(clientDataIds, playerDataId.clientId);
		clientDataId.udpPortNum = portNum;
		buffer_seek(bufferToSend, buffer_seek_start, 0);
		buffer_write(bufferToSend, buffer_seek_start, "udpConnection");
		network_send_udp(udp, clientDataId.ip, clientDataId.udpPortNum, bufferToSend, buffer_tell(bufferToSend));
	} else if (bufferType == "basicState") {
		var playerNum = buffer_read(receivedBuffer, buffer_u16);
		var xPos = buffer_read(receivedBuffer, buffer_u16);
		var yPos = buffer_read(receivedBuffer, buffer_u16);
		var playerDataId = ds_map_find_value(playerDataIds, playerNum);
		playerDataId.xPos = xPos;
		playerDataId.yPos = yPos;
	}
}