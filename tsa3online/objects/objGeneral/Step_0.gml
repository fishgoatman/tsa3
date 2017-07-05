/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 46FD5384
/// @DnDArgument : "code" "/// @description check win$(13_10)//check win$(13_10)if (gg == NONE) {$(13_10)    if (!instance_exists(tpId) && !instance_exists(opId)) {$(13_10)        gg = TIE;$(13_10)        scrWinStuff();$(13_10)    } else if (!instance_exists(tpId)) {$(13_10)        gg = KEYBOARD;$(13_10)        keyboardWins++;$(13_10)        scrWinStuff();$(13_10)    } else if (!instance_exists(opId)) {$(13_10)        gg = MOUSE;$(13_10)        mouseWins++;$(13_10)        scrWinStuff();$(13_10)    }$(13_10)    $(13_10)    if (mouseWins >= firstTo) {$(13_10)        instance_create(signX, signY, objMouseWin);$(13_10)    } else if (keyboardWins >= firstTo) {$(13_10)        instance_create(signX, signY, objKeyboardWin);$(13_10)    }$(13_10)}"
/// @description check win
//check win
if (gg == NONE) {
    if (!instance_exists(tpId) && !instance_exists(opId)) {
        gg = TIE;
        scrWinStuff();
    } else if (!instance_exists(tpId)) {
        gg = KEYBOARD;
        keyboardWins++;
        scrWinStuff();
    } else if (!instance_exists(opId)) {
        gg = MOUSE;
        mouseWins++;
        scrWinStuff();
    }
    
    if (mouseWins >= firstTo) {
        instance_create(signX, signY, objMouseWin);
    } else if (keyboardWins >= firstTo) {
        instance_create(signX, signY, objKeyboardWin);
    }
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1E905D73
/// @DnDArgument : "code" "///@description server stuff$(13_10)if (!connectedToServer) {$(13_10)	bufferToSend = buffer_create(256, buffer_fixed, 1);$(13_10)	buffer_write(bufferToSend, buffer_string, "c");$(13_10)	network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));$(13_10)}"
///@description server stuff
if (!connectedToServer) {
	bufferToSend = buffer_create(256, buffer_fixed, 1);
	buffer_write(bufferToSend, buffer_string, "c");
	network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));
}