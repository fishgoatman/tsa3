/// @description check to start
if (!alarmStarted && tpId.lockedIn && otherLockedIn) {
    alarm[0] = 1 * room_speed;
    alarmStarted = true;
	rmNumber = irandom(array_length_1d(rooms));
}