/// @description start game
if (tpId.lockedIn && otherLockedIn) {
    room_goto(scrRandRoom());
} else {
    alarmStarted = false;
}

