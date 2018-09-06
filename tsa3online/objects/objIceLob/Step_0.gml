///@desc move
dy -= grav;
/// @description scrMove
var tryX = preciseX;
var tryY = preciseY;
var yDisp = 0;
var xDisp = 0;
var hyp = sqrt(dx * dx + dy * dy);
var tempDx = dx / hyp;
var tempDy = dy / hyp;
var createdAlready = false;
var hitBlock = false;

while (abs(yDisp) < abs(dy) && !place_meeting(tryX, tryY - tempDy, objBlock)) {
    tryY -= tempDy;
    yDisp -= tempDy;
	var collidingId = instance_place(tryX, tryY, objPlayer);
	
	if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
		instance_create_depth(tryX, tryY, id, hitbox);
		createdAlready = true;
		break;
	}
}

while (abs(xDisp) < abs(dx) && !place_meeting(tryX + tempDx, tryY, objBlock)) {
    tryX += tempDx;
    xDisp += tempDx;
	var collidingId = instance_place(tryX, tryY, objPlayer);
	
	if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
		instance_create_depth(tryX, tryY, id, hitbox);
		createdAlready = true;
		break;
	}
}

if (abs(xDisp) < abs(dx) || abs(yDisp) < abs(dy)) {
	if (!createdAlready) {
		instance_create_depth(tryX, tryY, id, hitbox);
		createdAlready = true;
		hitBlock = true;
	}
}

preciseX = tryX;
preciseY = tryY;
x = scrRound(preciseX);
y = scrRound(preciseY);

if (createdAlready) {
	if (hitBlock) {
		for (i = 0; i < smallLobNumber; i++) {
			instance_create_depth(preciseX, preciseY, id, objSmallIceLob)
			audio_play_sound(sndIceLobMiss, 1, false)
		}
	}
	
	instance_destroy();
}

var TWO = myHeroId.TWO;

if (!createdAlready && myHeroId.durationHeld[TWO] > 0 && !myHeroId.heldBefore[TWO]) {
	for (i = 0; i < smallLobNumber; i++) {
		instance_create_depth(preciseX, preciseY, id, objSmallIceLob);
	}
	
	instance_create_depth(tryX, tryY, id, hitbox);
	instance_destroy();
}