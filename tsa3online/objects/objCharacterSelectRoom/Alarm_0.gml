/// @description start game
if (tpId.lockedIn && testingMode || tpId.lockedIn && otherLockedIn) {
    room_goto(rooms[rmNumber]);
} else {
    alarmStarted = false;
}