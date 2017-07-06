/// @description check to start
show_debug_message("tli = " + string(tpId.lockedIn) + " oli = " + string(otherLockedIn));

if (!alarmStarted && tpId.lockedIn && otherLockedIn) {
    alarm[0] = 1 * room_speed;
    alarmStarted = true;
}