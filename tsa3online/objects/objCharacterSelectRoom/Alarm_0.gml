/// @description start game
if (tpId.lockedIn && otherLockedIn) {
    room_goto(rooms[rmNumber]);
	show_debug_message("rmNumber = " + string(rmNumber));
} else {
    alarmStarted = false;
}