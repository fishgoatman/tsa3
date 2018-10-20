///@desc blink
if (room == rmCharacterSelect) {
	time++

	for (var i = 0; i < array_length_1d(keys); i++) {
		if (keyboard_check(keys[i])) {
			time = 0
		}
	}

	if (time >= waitTime && !lockedIn[0]) {
		image_speed = 1
	} else {
		image_speed = 0
		image_index = 0
	}
} else if (room == rmOPCharacterSelect) {
	time++

	for (var i = 0; i < array_length_1d(keys); i++) {
		if (keyboard_check(keys[i]) || keyboard_check(keys2[i])) {
			time = 0
		}
	}

	if (time >= waitTime && !lockedIn[0]) {
		image_speed = 1
	} else {
		image_speed = 0
		image_index = 0
	}
	
	objRightControls.image_index = image_index
} else if (room == rmMapSelect) {
	time++

	for (var i = 0; i < array_length_1d(keys); i++) {
		if (keyboard_check(keys[i]) || keyboard_check(keys2[i])) {
			time = 0
		}
	}

	if (time >= waitTime && !mapLockedIn) {
		image_speed = 1
	} else {
		image_speed = 0
		image_index = 0
	}
	
	objRightControls.image_index = image_index
}