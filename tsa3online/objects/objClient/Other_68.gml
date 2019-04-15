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
		var playerServerNum = buffer_read(receivedBuffer, buffer_u16);
		thisInControl[thisNumber] = true
		playerServerNums[thisNumber] = playerServerNum
		
		//game start stuff
		ds_list_clear(executedAbilitySentNums)
	} else if (bufferType == PING_TEST) {
		ds_list_add(receivedTimes, current_time)
		var serverTime = buffer_read(receivedBuffer, buffer_f32)
		ds_list_add(serverTimes, serverTime)
		
		if (ds_list_size(receivedTimes) > pingKeepNum) {
			ds_list_delete(receivedTimes, 0)
		}
		
		if (ds_list_size(serverTimes) > pingKeepNum) {
			ds_list_delete(serverTimes, 0)
		}
		
		var pingTot = 0
		var delayTot = 0
		var sentTimesSize = ds_list_size(sentTimes)
		
		for (var i = 0; i < sentTimesSize; i++) {
			pingTot += dslfv(receivedTimes, i) - dslfv(sentTimes, i)
			delayTot += (dslfv(receivedTimes, i) + dslfv(sentTimes, i)) / 2 - dslfv(serverTimes, i)
		}
		
		ping = pingTot / sentTimesSize
		delay = delayTot / sentTimesSize
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
			var thisNumber = buffer_read(receivedBuffer, buffer_u8)
			lockedIn[thisNumber] = buffer_read(receivedBuffer, buffer_bool)
			selectedHero[thisNumber] = buffer_read(receivedBuffer, buffer_string)
		} else if (bufferType == ABILITY) {
			var thisNumber = buffer_read(receivedBuffer, buffer_u8)
			myHeroId = heroId[thisNumber]
			var abilitySentNum = buffer_read(receivedBuffer, buffer_u16)
			
			if (instance_exists(myHeroId) && ds_list_find_index(executedAbilitySentNums, abilitySentNum) == -1) {
				myHeroId.abilityPreciseX = buffer_read(receivedBuffer, buffer_f32)
				myHeroId.abilityPreciseY = buffer_read(receivedBuffer, buffer_f32)
				myHeroId.abilityImageXScale = buffer_read(receivedBuffer, buffer_bool) ? 1 : -1
				myHeroId.aState = buffer_read(receivedBuffer, buffer_string)
				myHeroId.timeToActivate = buffer_read(receivedBuffer, buffer_f32) + delay
				myHeroId.firstTime = true
				ds_list_add(executedAbilitySentNums, abilitySentNum)
			}
		} else if (bufferType == LOB) {
			var thisNumber = buffer_read(receivedBuffer, buffer_u8)
			myHeroId = heroId[thisNumber]
			var detonateTime = buffer_read(receivedBuffer, buffer_f32) + delay
			
			if (instance_exists(myHeroId) && instance_exists(myHeroId.lobId) && myHeroId.lobId.detonateTime == -1) {
				myHeroId.lobId.detonateTime = detonateTime
			}
		} else if (bufferType == BALL) {
			var thisNumber = buffer_read(receivedBuffer, buffer_u8)
			myHeroId = heroId[thisNumber]
			var detonateTime = buffer_read(receivedBuffer, buffer_f32) + delay
			
			if (instance_exists(myHeroId) && instance_exists(myHeroId.ballId) && myHeroId.ballId.detonateTime == -1) {
				myHeroId.ballId.detonateTime = detonateTime
			}
		}
	}
}