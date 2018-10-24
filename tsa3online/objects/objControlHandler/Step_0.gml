///@desc change keys
if (numForChange != -1) {
	if (keyboard_check_pressed(vk_anykey)) {
		for (var i = 0; i < 2; i++) {
			if (i == 0) {
				var array = leftControls
			} else if (i == 1) {
				var array = rightControls
			}
	
			for (var j = 0; j < numKeys; j++) {
				if (keyboard_lastkey == array[j]) {
					if (i == 0) {
						leftControls[j] = arrayForChange[numForChange]
					} else if (i == 1) {
						rightControls[j] = arrayForChange[numForChange]
					}
				}
			}
		}
		
		if (arrayForChange == leftControls) {
			leftControls[numForChange] = keyboard_lastkey
		} else if (arrayForChange == rightControls) {
			rightControls[numForChange] = keyboard_lastkey
		}
		
		numForChange = -1
		show_debug_message("A" + scrKeyToString(keyboard_lastkey))
	}
} else {
	if (keyboard_check_pressed(vk_anykey)) {
		for (var i = 0; i < 2; i++) {
			if (i == 0) {
				var array = leftControls
			} else if (i == 1) {
				var array = rightControls
			}
	
			for (var j = 0; j < numKeys; j++) {
				if (keyboard_lastkey == array[j]) {
					arrayForChange = array
					numForChange = j
				}
			}
		}
		
		show_debug_message("B" + scrKeyToString(keyboard_lastkey))
	}
}