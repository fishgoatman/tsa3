/// @description act based on server data
//pos
preciseX = otherX;
preciseY = otherY;
x = scrRound(preciseX);
y = scrRound(preciseY);

//sprite and image
sprite_index = otherSpriteIndex;
image_index = otherImageIndex;
image_xscale = otherXScale;

//abilities
if (otherOneActivate) {
	for (var i = 0; i < fireShotAmount; i++) {
		fireShotAngle = 90 - image_xscale * 90 + fireShotSpread * i / (fireShotAmount - 1) - fireShotSpread / 2;
		instance_create(preciseX, preciseY, objFireShotOP);
	}
	
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

///die
if (hp <= 0) {
	instance_destroy();
}