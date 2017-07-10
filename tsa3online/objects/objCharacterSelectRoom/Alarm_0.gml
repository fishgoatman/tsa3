/// @description start game
if (testingMode && tpId.lockedIn) {
	room_goto(rm0);
}

if (tpId.lockedIn && otherLockedIn) {
    room_goto(rooms[rmNumber]);
} else {
    alarmStarted = false;
}