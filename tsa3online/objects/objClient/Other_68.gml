///@desc receive dataasdf
var portNum = async_load[? "port"];
show_debug_message(portNum);
var receivedBuffer = async_load[? "buffer"];
buffer_seek(receivedBuffer, buffer_seek_start, 0);
var bufferType = buffer_read(receivedBuffer, buffer_string);
	
if (portNum == tcpPortNum) {
	show_debug_message("tcp");
	
	if (bufferType == "tcpConnection") {
		show_debug_message("tcpConnection");
		show_debug_message("tcpConnection" + string(buffer_tell(receivedBuffer)));
		buffer_write(bufferToSend, buffer_string, "numPlayers");
		buffer_write(bufferToSend, buffer_u8, 1);
		network_send_packet(tcp, bufferToSend, buffer_tell(bufferToSend));
	} else if (bufferType == "thisNumber") {
		show_debug_message("thisNumber");
		//var thisNumber = buffer_read(receivedBuffer, buffer_u8);
		//var playerNum = buffer_read(receivedBuffer, buffer_u16);
		var useless = buffer_read(receivedBuffer, buffer_string);
		show_debug_message(useless);
		show_debug_message("thisNumber" + string(buffer_tell(receivedBuffer)));
		thisInControl[thisNumber] = true;
		playerNums[thisNumber] = playerNum;
	}
} else {
	show_debug_message("udp");
	
	if (bufferType == "udpConnection") {
		udpConnected = true;
	} else if (udpConnected) {
		if (bufferType == "basicState") {
			var thisNumber = buffer_read(receivedBuffer, buffer_u8);
			var xPos = buffer_read(receivedBuffer, buffer_u16);
			var yPos = buffer_read(receivedBuffer, buffer_u16);
			heroId[thisNumber].x = xPos;
			heroId[thisNumber].y = yPos;
		}
	}
}