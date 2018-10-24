///@desc get input
if (thisInControl[thisNumber]) {
	var arrayToUse;

	if (thisNumber == 0) {
		arrayToUse = leftControls;
	} else if (thisNumber == 1) {
		arrayToUse = rightControls;
	}

	for (var i = 0; i < numKeys; i++) {
		if (thisNumber == 0 || rightControlMode == "keyboard" || i >= 4 || room == rmCharacterSelect) {
			if (false) {
				if (thisNumber == 0) {
					if (keyboard_check(leftControls[i]) || keyboard_check(rightControls[i])) {
						if (durationHeld[i] > 0) {
							heldBefore[i] = true;
						}
		
						durationHeld[i]++;
					} else {
						durationHeld[i] = 0;
						heldBefore[i] = false;
					}
				} else {
					var tempI
					
					if (i == 1) {
						tempI = 3
					} else if (i == 3) {
						tempI = 1
					} else {
						tempI = i
					}
					
					if (keyboard_check(leftControls[i]) || keyboard_check(rightControls[i])) {
						if (durationHeld[tempI] > 0) {
							heldBefore[tempI] = true;
						}
		
						durationHeld[tempI]++;
					} else {
						durationHeld[tempI] = 0;
						heldBefore[tempI] = false;
					}
				}
			} else if (playerMode == "two") {
				if (keyboard_check(arrayToUse[i])) {
					if (durationHeld[i] > 0) {
						heldBefore[i] = true;
					}
		
					durationHeld[i]++;
				} else {
					durationHeld[i] = 0;
					heldBefore[i] = false;
				}
			} else if (playerMode == "one") {
				if (keyboard_check(leftControls[i]) || keyboard_check(rightControls[i])) {
					if (durationHeld[i] > 0) {
						heldBefore[i] = true;
					}
		
					durationHeld[i]++;
				} else {
					durationHeld[i] = 0;
					heldBefore[i] = false;
				}
			}
		} else if (rightControlMode == "mouse") {
			if (i == 0) {
				if (mouse_check_button(mb_right)) {
					if (durationHeld[i] > 0) {
						heldBefore[i] = true;
					}
		
					durationHeld[i]++;
				} else {
					durationHeld[i] = 0;
					heldBefore[i] = false;
				}
			}
		
			var offset = 10;
			var mouseMiddle = maxMouseX + offset * -image_xscale;
		
			if (i == 1) {
				if (mouse_check_button(mb_left) && mouse_x < mouseMiddle) {
					if (durationHeld[i] > 0) {
						heldBefore[i] = true;
					}
		
					durationHeld[i]++;
				} else {
					durationHeld[i] = 0;
					heldBefore[i] = false;
				}
			}
		
			if (i == 2) {
				if (mouse_y > room_width * 2 / 3) {
					if (durationHeld[i] > 0) {
						heldBefore[i] = true;
					}
		
					durationHeld[i]++;
				} else {
					durationHeld[i] = 0;
					heldBefore[i] = false;
				}
			}
		
			if (i == 3) {
				if (mouse_check_button(mb_left) && mouse_x > mouseMiddle) {
					if (durationHeld[i] > 0) {
						heldBefore[i] = true;
					}
		
					durationHeld[i]++;
				} else {
					durationHeld[i] = 0;
					heldBefore[i] = false;
				}
			}
		
			if (abs(mouse_x) * image_xscale > maxMouseX * image_xscale) {
				maxMouseX = mouse_x;
			}
		}
	}
}