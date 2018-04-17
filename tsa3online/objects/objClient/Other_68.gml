///@desc receive data
var type = async_load[? "type"];

if (type == network_type_data) {
	var receivedBuffer = async_load[? "buffer"];
	var portNum = async_load[? "port"];
	show_debug_message("A");
	var bufferType = buffer_read(receivedBuffer, buffer_string);
	show_debug_message(bufferType);
	
	if (bufferType == "connected") {
		buffer_write(bufferToSend, buffer_string, "numPlayers");
		buffer_write(bufferToSend, buffer_u8, 1);
		network_send_packet(tcp, bufferToSend, buffer_tell(bufferToSend));
	} else if (bufferType == "thisNumber") {
		var thisNumber = buffer_read(receivedBuffer, buffer_u8);
		show_debug_message(thisNumber);
		var playerNum = buffer_read(receivedBuffer, buffer_u16);
		show_debug_message(playerNum);
		thisInControl[thisNumber] = true;
		playerNums[thisNumber] = playerNum;
	} else if (bufferType == "udpConnection") {
		udpConnected = true;
	} else if (bufferType == "basicState") {
		var thisNumber = buffer_read(receivedBuffer, buffer_u8);
		var xPos = buffer_read(receivedBuffer, buffer_u16);
		var yPos = buffer_read(receivedBuffer, buffer_u16);
		heroId[thisNumber].x = xPos;
		heroId[thisNumber].y = yPos;
	}
	
	show_debug_message("D");
}

show_debug_message("E");