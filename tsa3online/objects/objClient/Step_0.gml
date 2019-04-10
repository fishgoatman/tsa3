///@desc send data
///tcp
if (tcpConnected) {
	//ping tests
	if (pingInBwnCounter >= pingInBwn) {
		buffer_seek(bufferToSend, buffer_seek_start, 0)
		buffer_write(bufferToSend, buffer_u8, PING_TEST)
		buffer_write(bufferToSend, buffer_f32, current_time)
		network_send_packet(tcp, bufferToSend, buffer_tell(bufferToSend))
		ds_list_add(sentTimes, current_time)
	
		if (ds_list_size(sentTimes) > pingKeepNum) {
			ds_list_delete(sentTimes, 0)
		}
	
		pingInBwnCounter = 0
	}
	
	pingInBwnCounter++
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
			if (scrInArena()) {
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
				
				//ability
				if (myHeroId.aState != "n") {
					buffer_seek(bufferToSend, buffer_seek_start, 0);
					buffer_write(bufferToSend, buffer_u8, ABILITY);
					buffer_write(bufferToSend, buffer_u16, playerNums[i]);
					buffer_write(bufferToSend, buffer_string, myHeroId.clientAState);
					buffer_write(bufferToSend, buffer_f32, myHeroId.timeToActivate - delay);
					network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
				}
			}
			
			if (room == rmCharacterSelect) {
				//locked in
				buffer_seek(bufferToSend, buffer_seek_start, 0);
				buffer_write(bufferToSend, buffer_u8, LOCKED_IN);
				buffer_write(bufferToSend, buffer_u16, playerNums[i]);
				buffer_write(bufferToSend, buffer_bool, lockedIn[i]);
				buffer_write(bufferToSend, buffer_string, selectedHero[i]);
				network_send_udp(udp, ipNum, udpPortNum, bufferToSend, buffer_tell(bufferToSend));
			}
		}
	}
}