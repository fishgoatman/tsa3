///@desc receive data
var receivedBuffer = async_load[? "buffer"];
var portNum = async_load[? "port"];

if (portNum == tcpPortNum) {
	var bufferType = buffer_read(receivedBuffer, buffer_string);
	
	if (bufferType == "connected") {
		buffer_seek(bufferToSend, buffer_seek_start, 0);
		buffer_write(bufferToSend, buffer_string, "numPlayers");
		buffer_write(bufferToSend, buffer_u8, 2);
		network_send_packet(tcp, bufferToSend, buffer_tell(bufferToSend));
	} else if (bufferType == "thisNumber") {
		var thisNumber = buffer_read(receivedBuffer, buffer_u8);
		var playerNum = buffer_read(receivedBuffer, buffer_u16);
		thisInControl[thisNumber] = true;
		playerNums[thisNumber] = playerNum;
	}
} else if (portNum == udpPortNum) {
	var bufferType = buffer_read(receivedBuffer, buffer_string);
	
	if (bufferType == "basicState") {
		var thisNumber = buffer_read(receivedBuffer, buffer_u8);
		var xPos = buffer_read(receivedBuffer, buffer_u16);
		var yPos = buffer_read(receivedBuffer, buffer_u16);
		heroId[thisNumber].x = xPos;
		heroId[thisNumber].y = yPos;
	}
}