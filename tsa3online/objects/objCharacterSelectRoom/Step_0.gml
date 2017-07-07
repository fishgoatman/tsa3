/// @description check to start
if (!alarmStarted && tpId.lockedIn && otherLockedIn) {
    alarm[0] = 1 * room_speed;
    alarmStarted = true;
}

show_debug_message("tli = " + string(tpId.lockedIn) + " and oli = " + string(otherLockedIn));