/// @description scrWinStuff
var tmWins;
var okWins;

if (mode == "online") {
	tmWins = thisWins;
	okWins = otherWins;
} else if (mode == "offline") {
	tmWins = mouseWins;
	okWins = keyboardWins;
}

alarm[NEXT_GAME] = victoryTime;
rmNumber = scrRandRmNumber();
var keyboardObj;
var mouseObj;

if (tmWins == 0) {
    mouseObj = objZero;
} else if (tmWins == 1) {
    mouseObj = objOne;
} else if (tmWins == 2) {
    mouseObj = objTwo;
} else if (tmWins == 3) {
    mouseObj = objThree;
}


if (okWins == 0) {
    keyboardObj = objZero;
} else if (okWins == 1) {
    keyboardObj = objOne;
} else if (okWins == 2) {
    keyboardObj = objTwo;
} else if (okWins == 3) {
    keyboardObj = objThree;
}
instance_create(room_width * 2 / 3, room_height * 2 / 3, mouseObj);
instance_create(room_width / 3, room_height * 2 / 3, keyboardObj);
instance_create(room_width / 2, room_height * 2 / 3, objDash);