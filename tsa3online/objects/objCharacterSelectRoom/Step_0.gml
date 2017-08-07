/// @description check to start
if (!alarmStarted) {
	if (mode == "online") {
		if (tpId.lockedIn && otherLockedIn) {
		    alarm[0] = afterSelectTime;
			alarmStarted = true;
		}
	} else if (mode == "offline") {
		if (mpId.lockedIn && kpId.lockedIn) {
		    alarm[0] = afterSelectTime;
			alarmStarted = true;
		}
	}
}