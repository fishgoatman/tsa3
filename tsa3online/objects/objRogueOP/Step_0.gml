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
	var diffX = mouse_x - x;
	var diffY = y - mouse_y;
	var hyp = sqrt(diffX * diffX + diffY * diffY);
	dx = dashSpd * diffX / hyp;
	dy = dashSpd * diffY / hyp;
			
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