/// @description scrKeyboardGetInput
kpId.state = NONE;
kpId.onePressed = false;
kpId.oneReleased = false;
kpId.twoPressed = false;
kpId.threePressed = false;
kpId.fourPressed = false;

if (keyboard_check_direct(ord("G"))) {
    kpId.direct = RIGHT;
    kpId.state = MOVE;
} else if (keyboard_check_direct(ord("D"))) {
    kpId.direct = LEFT;
    kpId.state = MOVE;
}

if (keyboard_check_direct(ord("R"))) {
	kpId.upHeld = true;
}

if (keyboard_check_pressed(ord("R"))) {
	kpId.upPressed = true;
}

if (keyboard_check_direct(ord("F"))) {
    kpId.ducking = true;
} else {
    kpId.ducking = false;
}

if (kpId.isSelectHero) {
	if (keyboard_check_pressed(ord("1"))) {
		kpId.onePressed = true;
	}
	
	if (keyboard_check_pressed(ord("2"))) {
		kpId.twoPressed = true;
	}
} else {
	if (keyboard_check_direct(ord("1"))) {
		kpId.onePressed = true;
	}
	
	if (keyboard_check_released(ord("1"))) {
		kpId.oneReleased = true;
	}
	
	if (keyboard_check_direct(ord("2"))) {
		kpId.twoPressed = true;
	}
	
	if (keyboard_check_direct(ord("3"))) {
		kpId.threePressed = true;
	}
	
	if (keyboard_check_direct(ord("4"))) {
		kpId.fourPressed = true;
	}
}