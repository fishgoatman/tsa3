/// @description start game
if (testingMode && tpId.lockedIn) {
	room_goto(rm0);
} else if (tpId.lockedIn && otherLockedIn) {
	show_debug_message("rooms_goto");
    room_goto(rooms[rmNumber]);
} else {
    alarmStarted = false;
}