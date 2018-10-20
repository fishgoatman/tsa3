///@desc blink
if (room == rmCharacterSelect) {
	time++

	for (var i = 0; i < array_length_1d(keys); i++) {
		if (keyboard_check(keys[i])) {
			time = 0
		}
	}

	if (time >= waitTime && !lockedIn[1]) {
		image_speed = 1
	} else {
		image_speed = 0
		image_index = 0
	}
}