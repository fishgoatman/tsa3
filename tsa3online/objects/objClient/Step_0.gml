///@desc send data
//basics
for (var i = 0; i < numPlayers; i++) {
	if (thisInControl[i]) {
		buffer_seek(bufferToSend, buffer_seek_start, 0);
		var str = "basicState" + string(playerNums[i]);
		show_debug_message(str);
		show_debug_message(string(playerNums[i]));
		buffer_write(bufferToSend, buffer_string, str);
		network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
	}
}