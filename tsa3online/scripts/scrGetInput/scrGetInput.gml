/// @description get input
//CHANGE::::::: make this not take care of checking for jumps, just saying that up was pressed
heroId.state = NONE;

if (keyboard_check_direct(vk_right) || keyboard_check_direct(ord("G"))) {
    heroId.direct = RIGHT;
    heroId.state = MOVE;
} else if (keyboard_check_direct(vk_left) || keyboard_check_direct(ord("D"))) {
    heroId.direct = LEFT;
    heroId.state = MOVE;
}

var jumpButton;

if (heroId.isSelectHero) {
    jumpButton = keyboard_check_direct(vk_up) || keyboard_check_direct(ord("R"));
} else {
    jumpButton = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("R"));
}

if (jumpButton) {
	heroId.upPressed = true;
}

if (keyboard_check_direct(vk_down) || keyboard_check_direct(ord("F"))) {
    heroId.ducking = true;
} else {
    heroId.ducking = false;
}

if (heroId.attackState == NONE && attackKey) {
    heroId.attackState = INIT_ATTACK;
}

if (abilityKey) {
    heroId.abilityState = INIT_ABILITY;
} else {
    heroId.abilityState = NONE;
}

if (keyboard_check_direct(ord("3"))) {
    heroId.threeState = INIT_THREE;
}
    
if (keyboard_check_direct(ord("4"))) {
    heroId.fourState = INIT_FOUR;
}
