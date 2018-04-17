///@desc send data
//connection
if (!udpConnected) {
	for (var i = 0; i < numPlayers; i++) {
		if (thisInControl[i]) {
			bufferToSend = scrCreateBuffer();
			buffer_seek(bufferToSend, buffer_seek_start, 0);
			buffer_write(bufferToSend, buffer_string, "udpConnection");
			buffer_write(bufferToSend, buffer_u16, playerNums[i]);
			network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
			buffer_delete(bufferToSend);
			break;
		}
	}
}

//basics
for (var i = 0; i < numPlayers; i++) {
	if (thisInControl[i]) {
		bufferToSend = scrCreateBuffer();
		buffer_seek(bufferToSend, buffer_seek_start, 0);
		buffer_write(bufferToSend, buffer_string, "basicState");
		buffer_write(bufferToSend, buffer_u16, playerNums[i]);
		buffer_write(bufferToSend, buffer_u16, heroId[i].x);
		buffer_write(bufferToSend, buffer_u16, heroId[i].y);
		network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
		buffer_delete(bufferToSend);
	}
}