///@desc get input
var arrayToUse;

if (thisNumber == 0) {
	arrayToUse = leftKeyOrder;
} else if (thisNumber == 1) {
	arrayToUse = rightKeyOrder;
}

for (var i = 0; i < numKeys; i++) {
	if (thisNumber == 0 || rightControlMode == "keyboard" || i >= 4) {
		if (keyboard_check_direct(arrayToUse[i])) {
			if (durationHeld[i] > 0) {
				heldBefore[i] = true;
			}
		
			durationHeld[i]++;
		} else {
			durationHeld[i] = 0;
			heldBefore[i] = false;
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