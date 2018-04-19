///@desc receive data
var portNum = async_load[? "port"];
var receivedBuffer = async_load[? "buffer"];
buffer_seek(receivedBuffer, buffer_seek_start, 0);
var bufferType = buffer_read(receivedBuffer, buffer_string);
	
if (portNum == tcpPortNum) {
	if (bufferType == "tcpConnection") {
		buffer_write(bufferToSend, buffer_string, "numPlayers");
		buffer_write(bufferToSend, buffer_u8, 1);
		network_send_packet(tcp, bufferToSend, buffer_tell(bufferToSend));
	} else if (bufferType == "thisNumber") {
		var thisNumber = buffer_read(receivedBuffer, buffer_u8);
		var playerNum = buffer_read(receivedBuffer, buffer_u16);
		thisInControl[thisNumber] = true;
		playerNums[thisNumber] = playerNum;
	}
} else {
	if (!udpConnected) {
		if (bufferType == "udpConnection") {
			udpConnected = true;
			show_debug_message("udpConnected");
		}
	} else {
		if (bufferType == "basicState") {
			var thisNumber = buffer_read(receivedBuffer, buffer_u8);
			var xPos = buffer_read(receivedBuffer, buffer_u16);
			var yPos = buffer_read(receivedBuffer, buffer_u16);
			heroId[thisNumber].x = xPos;
			heroId[thisNumber].y = yPos;
			show_debug_message(thisNumber);
		}
	}
}