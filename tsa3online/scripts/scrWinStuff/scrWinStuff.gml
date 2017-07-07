/// @description scrWinStuff
alarm[NEXT_GAME] = victoryTime;
rmNumber = -1;
var keyboardObj;
var mouseObj;

if (otherWins == 0) {
    keyboardObj = objZero;
} else if (otherWins == 1) {
    keyboardObj = objOne;
} else if (otherWins == 2) {
    keyboardObj = objTwo;
} else if (otherWins == 3) {
    keyboardObj = objThree;
}

if (thisWins == 0) {
    mouseObj = objZero;
} else if (thisWins == 1) {
    mouseObj = objOne;
} else if (thisWins == 2) {
    mouseObj = objTwo;
} else if (thisWins == 3) {
    mouseObj = objThree;
}

instance_create(room_width * 2 / 3, room_height * 2 / 3, mouseObj);
instance_create(room_width / 3, room_height * 2 / 3, keyboardObj);
instance_create(room_width / 2, room_height * 2 / 3, objDash);