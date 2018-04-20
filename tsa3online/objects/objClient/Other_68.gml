///@desc receive data
var portNum = async_load[? "port"];
var receivedBuffer = async_load[? "buffer"];
buffer_seek(receivedBuffer, buffer_seek_start, 0);
var bufferType = buffer_read(receivedBuffer, buffer_u8);

if (portNum == tcpPortNum) {
	if (bufferType == TCP_CONNECTION) {
		buffer_write(bufferToSend, buffer_u8, NUM_PLAYERS);
		buffer_write(bufferToSend, buffer_u8, 1);
		network_send_packet(tcp, bufferToSend, buffer_tell(bufferToSend));
		tcpConnected = true;
		show_debug_message("currTime = " + string(current_time));
	} else if (bufferType == THIS_NUMBER) {
		var thisNumber = buffer_read(receivedBuffer, buffer_u8);
		var playerNum = buffer_read(receivedBuffer, buffer_u16);
		thisInControl[thisNumber] = true;
		playerNums[thisNumber] = playerNum;
	} else if (bufferType == DELAY_TEST) {
		var receivedTestNum = buffer_read(receivedBuffer, buffer_u8);
		serverTimes[receivedTestNum] = buffer_read(receivedBuffer, buffer_f32);
		receivedTimes[receivedTestNum] = current_time;
		numReceivedTests++;
	}
} else {
	if (!udpConnected) {
		if (bufferType == UDP_CONNECTION) {
			udpConnected = true;
			show_debug_message("udpConnected");
		}
	} else {
		if (bufferType == BASIC_STATE) {
			var thisNumber = buffer_read(receivedBuffer, buffer_u8);
			var myHeroId = heroId[thisNumber];
			
			if (instance_exists(myHeroId)) {
				myHeroId.x = buffer_read(receivedBuffer, buffer_u16);
				myHeroId.y = buffer_read(receivedBuffer, buffer_u16);
				myHeroId.sprite_index = buffer_read(receivedBuffer, buffer_s16);
				myHeroId.image_xscale = buffer_read(receivedBuffer, buffer_s8);
				myHeroId.clientGivenHp = buffer_read(receivedBuffer, buffer_u8);
			}
		} else if (bufferType == LOCKED_IN) {
			var thisNumber = buffer_read(receivedBuffer, buffer_u8);
			lockedIn[thisNumber] = buffer_read(receivedBuffer, buffer_bool);
			selectedHero[thisNumber] = buffer_read(receivedBuffer, buffer_string);
		} else if (bufferType == ABILITY) {
			var thisNumber = buffer_read(receivedBuffer, buffer_u8);
			myHeroId = heroId[thisNumber];
			
			if (instance_exists(myHeroId)) {
				myHeroId.aState = buffer_read(receivedBuffer, buffer_string);
				myHeroId.timeToActivate = buffer_read(receivedBuffer, buffer_f32) + clientServerDelay;
			}
		}
	}
}