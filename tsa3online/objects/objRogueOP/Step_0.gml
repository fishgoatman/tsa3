/// @description act based on server data
//pos
preciseX = otherX;
preciseY = otherY;
x = scrRound(preciseX);
y = scrRound(preciseY);

//abilities
if (otherOneActivate) {
	with (objKnifeOP) {
		instance_destroy();
	}
	
	instance_create(preciseX, preciseY, objKnifeOP);
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

//sprite and image
sprite_index = otherSpriteIndex;
image_index = otherImageIndex;
image_xscale = otherXScale;

///die
if (hp <= 0) {
	instance_destroy();
}