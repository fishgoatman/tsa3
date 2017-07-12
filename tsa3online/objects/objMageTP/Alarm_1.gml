/// @description pre attack
for (var i = 0; i < fireShotAmount; i++) {
	fireShotAngle = 90 - direct * 90 + fireShotSpread * i / (fireShotAmount - 1) - fireShotSpread / 2;
	instance_create(preciseX, preciseY, objFireShotTP);
}

attackState = POST_ATTACK;
alarm[POST_ATTACK] = attackPostTime;
oneActivate = true;
image_index = 0;
recoilValue = oneRecoil * -direct;
naturalDx += recoilValue;