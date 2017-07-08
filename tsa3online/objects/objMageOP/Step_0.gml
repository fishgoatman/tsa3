/// @description act based on server data
//abilities
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
	scrOtherTakeDamage(hp - otherHp);
}

//pos
x = otherX;
y = otherY;

//sprite and image
sprite_index = otherSpriteIndex;
image_index = otherImageIndex;
image_xscale = otherXScale;

///die
if (hp <= 0) {
	instance_destroy();
}