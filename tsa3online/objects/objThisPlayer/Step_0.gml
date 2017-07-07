/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4669D4DA
/// @DnDArgument : "code" "///@description get input$(13_10)if (instance_exists(tpId)) {$(13_10)    scrGetInput();$(13_10)} else {$(13_10)    instance_destroy();$(13_10)}$(13_10)$(13_10)mask_index = object_get_sprite(hero);"
///@description get input
if (instance_exists(tpId)) {
    scrGetInput();
} else {
    instance_destroy();
}

mask_index = object_get_sprite(hero);

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 0314E518
/// @DnDArgument : "code" "/// @description send data to server$(13_10)if (connectedToServer) {$(13_10)	buffer_seek(bufferToSend, buffer_seek_start, 0);$(13_10)	buffer_write(bufferToSend, buffer_string, "p"); //stands for player data$(13_10)	buffer_write(bufferToSend, buffer_u16, tpId.x);$(13_10)	buffer_write(bufferToSend, buffer_bool, oneActivate);$(13_10)	buffer_write(bufferToSend, buffer_u16, tpId.y);$(13_10)	buffer_write(bufferToSend, buffer_bool, twoActivate);$(13_10)	buffer_write(bufferToSend, buffer_u16, mouse_x);$(13_10)	buffer_write(bufferToSend, buffer_bool, threeActivate);$(13_10)	buffer_write(bufferToSend, buffer_u16, mouse_y);$(13_10)	buffer_write(bufferToSend, buffer_bool, fourActivate);$(13_10)	buffer_write(bufferToSend, buffer_string, string(tpId.sprite_index));$(13_10)	buffer_write(bufferToSend, buffer_u16, tpId.image_index);$(13_10)	buffer_write(bufferToSend, buffer_u16, tpId.hp);$(13_10)	buffer_write(bufferToSend, buffer_s8, tpId.image_xscale);$(13_10)	$(13_10)	if (room == rmCharacterSelect) {$(13_10)		buffer_write(bufferToSend, buffer_string, "s");$(13_10)		buffer_write(bufferToSend, buffer_bool, tpId.lockedIn);$(13_10)		var heroToSend;$(13_10)		$(13_10)		if (thisPlayerHero == objMageTP) {$(13_10)			heroToSend = objMageOP;$(13_10)		} else if (thisPlayerHero == objSelectHeroTP) {$(13_10)			heroToSend = objSelectHeroOP;$(13_10)		}$(13_10)		$(13_10)		show_debug_message("heroToSend = " + string(heroToSend));$(13_10)		buffer_write(bufferToSend, buffer_string, string(heroToSend));$(13_10)	} else {$(13_10)		buffer_write(bufferToSend, buffer_string, "e");$(13_10)	}$(13_10)	$(13_10)	network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));$(13_10)	oneActivate = false;$(13_10)	twoActivate = false;$(13_10)	threeActivate = false;$(13_10)	fourActivate = false;$(13_10)}"
/// @description send data to server
if (connectedToServer) {
	buffer_seek(bufferToSend, buffer_seek_start, 0);
	buffer_write(bufferToSend, buffer_string, "p"); //stands for player data
	buffer_write(bufferToSend, buffer_u16, tpId.x);
	buffer_write(bufferToSend, buffer_bool, oneActivate);
	buffer_write(bufferToSend, buffer_u16, tpId.y);
	buffer_write(bufferToSend, buffer_bool, twoActivate);
	buffer_write(bufferToSend, buffer_u16, mouse_x);
	buffer_write(bufferToSend, buffer_bool, threeActivate);
	buffer_write(bufferToSend, buffer_u16, mouse_y);
	buffer_write(bufferToSend, buffer_bool, fourActivate);
	buffer_write(bufferToSend, buffer_string, string(tpId.sprite_index));
	buffer_write(bufferToSend, buffer_u16, tpId.image_index);
	buffer_write(bufferToSend, buffer_u16, tpId.hp);
	buffer_write(bufferToSend, buffer_s8, tpId.image_xscale);
	
	if (room == rmCharacterSelect) {
		buffer_write(bufferToSend, buffer_string, "s");
		buffer_write(bufferToSend, buffer_bool, tpId.lockedIn);
		var heroToSend;
		
		if (thisPlayerHero == objMageTP) {
			heroToSend = objMageOP;
		} else if (thisPlayerHero == objSelectHeroTP) {
			heroToSend = objSelectHeroOP;
		}
		
		show_debug_message("heroToSend = " + string(heroToSend));
		buffer_write(bufferToSend, buffer_string, string(heroToSend));
	} else {
		buffer_write(bufferToSend, buffer_string, "e");
	}
	
	network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));
	oneActivate = false;
	twoActivate = false;
	threeActivate = false;
	fourActivate = false;
}