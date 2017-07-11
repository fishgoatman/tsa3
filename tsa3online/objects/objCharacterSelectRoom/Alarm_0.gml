/// @description start game
if (tpId.lockedIn && otherLockedIn) {
    room_goto(rooms[rmNumber]);
} else {
    alarmStarted = false;
}