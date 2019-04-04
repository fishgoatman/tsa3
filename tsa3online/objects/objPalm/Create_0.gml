///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
image_angle = myHeroId.palmAngle + random_range(-myHeroId.palmAngleDiff, myHeroId.palmAngleDiff);
dx = myHeroId.palmSpd * dcos(image_angle);
dy = myHeroId.palmSpd * dsin(image_angle);
hitbox = objPalmHitbox;
time = myHeroId.palmDuration;
currTime = 0;
preciseX = x;
preciseY = y;

if (image_angle > 90 && image_angle < 270) {
	image_yscale = -1;
}

lastTime = current_time
iTime = current_time