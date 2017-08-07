/// @description scrMouseGetInput
mpId.state = NONE;
mpId.onePressed = false;
mpId.oneReleased = false;
mpId.twoPressed = false;
mpId.threePressed = false;
mpId.fourPressed = false;

if (keyboard_check_direct(vk_right)) {
    mpId.direct = RIGHT;
    mpId.state = MOVE;
} else if (keyboard_check_direct(vk_left)) {
    mpId.direct = LEFT;
    mpId.state = MOVE;
}

if (keyboard_check_direct(vk_up)) {
	mpId.upHeld = true;
}

if (keyboard_check_pressed(vk_up)) {
	mpId.upPressed = true;
}

if (keyboard_check_direct(vk_down)) {
    mpId.ducking = true;
} else {
    mpId.ducking = false;
}

if (mpId.isSelectHero) {
	if (mouse_check_button_pressed(mb_left)) {
		mpId.onePressed = true;
	}
	
	if (mouse_check_button_pressed(mb_right)) {
		mpId.twoPressed = true;
	}
} else {
	if (mouse_check_button(mb_left)) {
		mpId.onePressed = true;
	}
	
	if (mouse_check_button_released(mb_left)) {
		mpId.oneReleased = true;
	}
	
	if (mouse_check_button(mb_right)) {
		mpId.twoPressed = true;
	}
}