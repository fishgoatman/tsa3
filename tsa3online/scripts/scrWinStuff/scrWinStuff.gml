/// @description scrWinStuff
alarm[NEXT_GAME] = victoryTime;
var keyboardObj;
var mouseObj;

if (keyboardWins == 0) {
    keyboardObj = objZero;
} else if (keyboardWins == 1) {
    keyboardObj = objOne;
} else if (keyboardWins == 2) {
    keyboardObj = objTwo;
} else if (keyboardWins == 3) {
    keyboardObj = objThree;
}

if (mouseWins == 0) {
    mouseObj = objZero;
} else if (mouseWins == 1) {
    mouseObj = objOne;
} else if (mouseWins == 2) {
    mouseObj = objTwo;
} else if (mouseWins == 3) {
    mouseObj = objThree;
}

instance_create(room_width * 2 / 3, room_height * 2 / 3, mouseObj);
instance_create(room_width / 3, room_height * 2 / 3, keyboardObj);
instance_create(room_width / 2, room_height * 2 / 3, objDash);
