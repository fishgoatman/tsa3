/// @description start game
if (mode == "online") {
	if (tpId.lockedIn && otherLockedIn) {
	    room_goto(rooms[rmNumber]);
	} else {
	    alarmStarted = false;
	}
} else if (mode == "offline") {
	if (mpId.lockedIn && kpId.lockedIn) {
	    room_goto(rooms[rmNumber]);
	} else {
	    alarmStarted = false;
	}
}