/// @description scrGetInput
tpId.state = NONE;
tpId.onePressed = false;
tpId.oneReleased = false;
tpId.twoPressed = false;
tpId.threePressed = false;
tpId.fourPressed = false;

if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("G"))) {
	tpId.rightPressed = true;
} else if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("D"))) {
	tpId.leftPressed = true;
}

if (keyboard_check_direct(vk_right) || keyboard_check_direct(ord("G"))) {
    tpId.leftHeld = true;
} else if (keyboard_check_direct(vk_left) || keyboard_check_direct(ord("D"))) {
    tpId.rightHeld = true;
}

if (keyboard_check_direct(vk_up) || keyboard_check_direct(ord("R"))) {
	tpId.upHeld = true;
}

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("R"))) {
	tpId.upPressed = true;
}

if (keyboard_check_direct(vk_down) || keyboard_check_direct(ord("F"))) {
    tpId.ducking = true;
} else {
    tpId.ducking = false;
}

if (tpId.isSelectHero) {
	if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("1"))) {
		tpId.onePressed = true;
	}
	
	if (mouse_check_button_pressed(mb_right) || keyboard_check_pressed(ord("2"))) {
		tpId.twoPressed = true;
	}
} else {
	if (mouse_check_button(mb_left) || keyboard_check_direct(ord("1"))) {
		tpId.onePressed = true;
	}
	
	if (mouse_check_button_released(mb_left) || keyboard_check_released(ord("1"))) {
		tpId.oneReleased = true;
	}
	
	if (mouse_check_button(mb_right) || keyboard_check_direct(ord("2"))) {
		tpId.twoPressed = true;
	}
	
	if (keyboard_check_direct(ord("3"))) {
		tpId.threePressed = true;
	}
	
	if (keyboard_check_direct(ord("4"))) {
		tpId.fourPressed = true;
	}
}