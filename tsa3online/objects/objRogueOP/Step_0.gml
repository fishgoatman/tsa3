/// @description act based on server data
//pos
preciseX = otherX;
preciseY = otherY;
x = scrRound(preciseX);
y = scrRound(preciseY);

//abilities
if (otherOneActivate) {
	for (var i = 0; i < daggerAmount; i++) {
		daggerAngle = currAngle * i / (daggerAmount - 1) - currAngle / 2;
		instance_create(preciseX, preciseY, objDaggerOP);
	}
}

if (otherTwoActivate) {
	var diffX = otherMouseX - x;
	var diffY = y - otherMouseY;
	var hyp = sqrt(diffX * diffX + diffY * diffY);
	dx = diffX / hyp;
	dy = diffY / hyp;
			
	for (var i = 0; i < boltAmount; i++) {
		boltAngle = boltSpread * i / (boltAmount - 1) - boltSpread / 2;
		instance_create(preciseX, preciseY, objBoltOP);
	}

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