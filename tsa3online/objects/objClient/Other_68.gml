///@desc receive data
var receivedBuffer = async_load[? "buffer"];
var bufferType = buffer_read(receivedBuffer, buffer_string);

if (bufferType == "connected") {
	buffer_seek(bufferToSend, buffer_seek_start, 0);
	buffer_write(bufferToSend, buffer_string, "numPlayers");
	buffer_write(bufferToSend, buffer_u8, 1);
	network_send_packet(tcp, bufferToSend, buffer_tell(bufferToSend));
} else if (bufferType == "thisNumber") {
	var thisNumber = buffer_read(receivedBuffer, buffer_u8);
	thisInControl[thisNumber] = true;
}