/// @description act based on server data
//pos
x = otherX;
y = otherY;

//abilities
show_debug_message("ooa = " + string(otherOneActivate));

if (otherOneActivate) {
	instance_create(x, y, objFireballOP);
	otherOneActivate = false;
}

if (otherTwoActivate) {
	otherTwoActivate = false;
}

if (otherThreeActivate) {
	otherThreeActivate = false;
}

if (otherFourActivate) {
	otherFourActivate = false;
}

if (otherHp != hp) {
	scrTakeDamage(hp - otherHp);
}

//sprite and image
sprite_index = otherSpriteIndex;
image_index = otherImageIndex;
image_xscale = otherXScale;