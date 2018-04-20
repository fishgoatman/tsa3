///@desc send data
///tcp
if (tcpConnected) {
	//delay tests
	if (currTestNum < maxTestNum) {
		var currDateTime = current_time;
		buffer_seek(bufferToSend, buffer_seek_start, 0);
		buffer_write(bufferToSend, buffer_string, "delayTest");
		buffer_write(bufferToSend, buffer_u8, currTestNum);
		buffer_write(bufferToSend, buffer_f32, currDateTime);
		network_send_packet(tcp, bufferToSend, buffer_tell(bufferToSend));
		sentTimes[currTestNum] = currDateTime;
		currTestNum++;
	} else if (!calculatedDelay) {
		if (numReceivedTests == maxTestNum) {
			for (var i = 0; i < maxTestNum; i++) {
				totalDelay += (receivedTimes[i] + sentTimes[i]) / 2 - serverTimes[i];
			}
		
			clientServerDelay = totalDelay / maxTestNum;
			show_debug_message("delay = " + string(clientServerDelay));
			calculatedDelay = true;
		} else if (numReceivedTests > maxTestNum) {
			show_debug_message("too many tests received: " + string(numReceivedTests));
		}
	}
}

///udp
//connection
if (!udpConnected) {
	for (var i = 0; i < numPlayers; i++) {
		if (thisInControl[i]) {
			buffer_seek(bufferToSend, buffer_seek_start, 0);
			buffer_write(bufferToSend, buffer_string, "udpConnection");
			buffer_write(bufferToSend, buffer_u16, playerNums[i]);
			network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
			break;
		}
	}
} else {
	//data
	for (var i = 0; i < numPlayers; i++) {
		if (thisInControl[i]) {
			//basics
			var myHeroId = heroId[i];
			buffer_seek(bufferToSend, buffer_seek_start, 0);
			buffer_write(bufferToSend, buffer_string, "basicState");
			buffer_write(bufferToSend, buffer_u16, playerNums[i]);
			buffer_write(bufferToSend, buffer_u16, myHeroId.x);
			buffer_write(bufferToSend, buffer_u16, myHeroId.y);
			buffer_write(bufferToSend, buffer_s16, myHeroId.sprite_index);
			buffer_write(bufferToSend, buffer_s8, myHeroId.image_index);
			buffer_write(bufferToSend, buffer_s16, myHeroId.image_angle);
			buffer_write(bufferToSend, buffer_s8, myHeroId.image_xscale);
			network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
			
			//locked in
			if (room == rmCharacterSelectionScreen) {
				buffer_seek(bufferToSend, buffer_seek_start, 0);
				buffer_write(bufferToSend, buffer_string, "lockedIn");
				buffer_write(bufferToSend, buffer_u16, playerNums[i]);
				buffer_write(bufferToSend, buffer_bool, lockedIn[i]);
				buffer_write(bufferToSend, buffer_string, selectedHero[i]);
				network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
			}
		}
	}
}