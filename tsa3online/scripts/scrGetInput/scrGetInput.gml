/// @description get input
tpId.state = NONE;
onePressed = false;
twoPressed = false;
threePressed = false;
fourPressed = false;

if (keyboard_check_direct(vk_right) || keyboard_check_direct(ord("G"))) {
    tpId.direct = RIGHT;
    tpId.state = MOVE;
} else if (keyboard_check_direct(vk_left) || keyboard_check_direct(ord("D"))) {
    tpId.direct = LEFT;
    tpId.state = MOVE;
}

var jumpButton;

if (tpId.isSelectHero) {
    jumpButton = keyboard_check_direct(vk_up) || keyboard_check_direct(ord("R"));
} else {
    jumpButton = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("R"));
}

if (jumpButton) {
	tpId.upPressed = true;
}

if (keyboard_check_direct(vk_down) || keyboard_check_direct(ord("F"))) {
    tpId.ducking = true;
} else {
    tpId.ducking = false;
}

if (tpId.isSelectHero) {
	if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("1"))) {
		onePressed = true;
	}
	
	if (mouse_check_button_pressed(mb_right) || keyboard_check_pressed(ord("2"))) {
		twoPressed = true;
	}
} else {
	if (mouse_check_button(mb_left) || keyboard_check_direct(ord("1"))) {
		onePressed = true;
	}
	
	if (mouse_check_button(mb_right) || keyboard_check_direct(ord("2"))) {
		twoPressed = true;
	}
	
	if (keyboard_check_direct(ord("3"))) {
		threePressed = true;
	}
	
	if (keyboard_check_direct(ord("4"))) {
		fourPressed = true;
	}
}