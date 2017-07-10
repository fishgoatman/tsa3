/// @description check to start
if (!alarmStarted && ((testingMode && tpId.lockedIn) || (tpId.lockedIn && otherLockedIn))) {
    alarm[0] = 1 * room_speed;
	show_debug_message("alarm started");
    alarmStarted = true;
}