///@desc send data
///tcp
if (tcpConnected) {
	//delay tests
	if (currTestNum < maxTestNum) {
		var currDateTime = current_time;
		buffer_seek(bufferToSend, buffer_seek_start, 0);
		buffer_write(bufferToSend, buffer_u8, DELAY_TEST);
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
			buffer_write(bufferToSend, buffer_u8, UDP_CONNECTION);
			buffer_write(bufferToSend, buffer_u16, playerNums[i]);
			network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
			break;
		}
	}
} else {
	//data
	for (var i = 0; i < numPlayers; i++) {
		var myHeroId = heroId[i];
		
		if (thisInControl[i]) {
			//basics
			if (currTimeSinceLast >= maxTimeSinceLast) {
				buffer_seek(bufferToSend, buffer_seek_start, 0);
				buffer_write(bufferToSend, buffer_u8, BASIC_STATE);
				buffer_write(bufferToSend, buffer_u16, playerNums[i]);
				buffer_write(bufferToSend, buffer_u16, myHeroId.x);
				buffer_write(bufferToSend, buffer_u16, myHeroId.y);
				buffer_write(bufferToSend, buffer_s16, myHeroId.sprite_index);
				buffer_write(bufferToSend, buffer_s8, myHeroId.image_xscale);
				buffer_write(bufferToSend, buffer_u8, myHeroId.hp); //if max hp goes above 255 this will cause problems
				network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
				
				currTimeSinceLast = 0;
			} else {
				currTimeSinceLast++;
			}
			
			if (room == rmCharacterSelect) {
				//locked in
				buffer_seek(bufferToSend, buffer_seek_start, 0);
				buffer_write(bufferToSend, buffer_u8, LOCKED_IN);
				buffer_write(bufferToSend, buffer_u16, playerNums[i]);
				buffer_write(bufferToSend, buffer_bool, lockedIn[i]);
				buffer_write(bufferToSend, buffer_string, selectedHero[i]);
				network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
			} else {
				//ability
				if (myHeroId.aState != "n") {
					buffer_seek(bufferToSend, buffer_seek_start, 0);
					buffer_write(bufferToSend, buffer_u8, ABILITY);
					buffer_write(bufferToSend, buffer_u16, playerNums[i]);
					buffer_write(bufferToSend, buffer_string, myHeroId.clientAState);
					buffer_write(bufferToSend, buffer_f32, myHeroId.timeToActivate - clientServerDelay);
					network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
				}
			}
		}
	}
}