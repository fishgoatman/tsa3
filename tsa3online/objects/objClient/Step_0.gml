///@desc send data
//basics
for (var i = 0; i < numPlayers; i++) {
	if (thisInControl[i]) {
		buffer_seek(bufferToSend, buffer_seek_start, 0);
		buffer_write(bufferToSend, buffer_string, "basicState");
		buffer_write(bufferToSend, buffer_u32, playerNums[i]);
		buffer_write(bufferToSend, buffer_u32, heroId[i].x);
		buffer_write(bufferToSend, buffer_u32, heroId[i].y);
		network_send_udp(udp, ipNum, portNum, bufferToSend, buffer_tell(bufferToSend));
	}
}