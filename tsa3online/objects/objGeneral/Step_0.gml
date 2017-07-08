/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 46FD5384
/// @DnDArgument : "code" "/// @description check win$(13_10)//check win$(13_10)if (gg == NONE) {$(13_10)    if (!instance_exists(tpId) && !instance_exists(opId)) {$(13_10)        gg = TIE;$(13_10)        scrWinStuff();$(13_10)    } else if (!instance_exists(tpId)) {$(13_10)        gg = KEYBOARD;$(13_10)        otherWins++;$(13_10)        scrWinStuff();$(13_10)    } else if (!instance_exists(opId)) {$(13_10)        gg = MOUSE;$(13_10)        thisWins++;$(13_10)        scrWinStuff();$(13_10)    }$(13_10)    $(13_10)    if (thisWins >= firstTo) {$(13_10)        instance_create(signX, signY, objMouseWin);$(13_10)    } else if (otherWins >= firstTo) {$(13_10)        instance_create(signX, signY, objKeyboardWin);$(13_10)    }$(13_10)}"
/// @description check win
//check win
if (gg == NONE) {
    if (!instance_exists(tpId) && !instance_exists(opId)) {
        gg = TIE;
        scrWinStuff();
    } else if (!instance_exists(tpId)) {
        gg = KEYBOARD;
        otherWins++;
        scrWinStuff();
    } else if (!instance_exists(opId)) {
        gg = MOUSE;
        thisWins++;
        scrWinStuff();
    }
    
    if (thisWins >= firstTo) {
        instance_create(signX, signY, objMouseWin);
    } else if (otherWins >= firstTo) {
        instance_create(signX, signY, objKeyboardWin);
    }
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1E905D73
/// @DnDArgument : "code" "///@description server stuff$(13_10)if (!connectedToServer) {$(13_10)	buffer_seek(bufferToSend, buffer_seek_start, 0);$(13_10)	buffer_write(bufferToSend, buffer_string, "c"); //connection$(13_10)	network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));$(13_10)} else {$(13_10)	//constantly send game info$(13_10)	buffer_seek(bufferToSend, buffer_seek_start, 0);$(13_10)	buffer_write(bufferToSend, buffer_string, "g"); //game info$(13_10)	buffer_write(bufferToSend, buffer_u16, rmNumber); //room number$(13_10)	network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));$(13_10)}"
///@description server stuff
if (!connectedToServer) {
	buffer_seek(bufferToSend, buffer_seek_start, 0);
	buffer_write(bufferToSend, buffer_string, "c"); //connection
	network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));
} else {
	//constantly send game info
	buffer_seek(bufferToSend, buffer_seek_start, 0);
	buffer_write(bufferToSend, buffer_string, "g"); //game info
	buffer_write(bufferToSend, buffer_u16, rmNumber); //room number
	network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));
}