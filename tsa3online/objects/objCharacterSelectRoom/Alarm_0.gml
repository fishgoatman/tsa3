/// @description start game
if ((mouseAi || tpId.lockedIn) && (keyboardAi || opId.lockedIn)) {
    room_goto(scrRandRoom());
} else {
    alarmStarted = false;
}

