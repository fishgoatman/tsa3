/// @description check to start
if (!alarmStarted && tpId.lockedIn && opId.lockedIn) {
    alarm[0] = 1 * room_speed;
    alarmStarted = true;
}