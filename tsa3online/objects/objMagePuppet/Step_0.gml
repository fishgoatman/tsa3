///@desc abilities and dmg
///abilities
//reset firstTime
if (lastTimeToActivate != timeToActivate) {
	lastTimeToActivate = timeToActivate;
	firstTime = true;
}

if (aState == "1") {
	if (current_time >= timeToActivate && firstTime) {
		instance_create_depth(x, y, thisNumber, objFireSlashHitbox);
		timeSinceSlashBlast = 0;
			
		for (var i = 0; i < slashBlastAmount; i++) {
			blastAngle = 90 - image_xscale * 90 + slashBlastCentralAngle * image_xscale + slashBlastSpread * i / (slashBlastAmount - 1) - slashBlastSpread / 2;
			instance_create_depth(x + slashBlastAheadDist * dcos(blastAngle), y - slashBlastAheadDist * dsin(blastAngle), thisNumber, objFireShot);
		}
			
		firstTime = false;
	}
} else if (aState == "2") {
	if (current_time >= timeToActivate && firstTime) {
		for (var i = 0; i < maxLobs; i++) {
			var angleDir = i % 2 == 0 ? -1 : 1;
			var angle = lobBaseAngle + angleDir * lobAngleBetween * floor((i + 1) / 2);
			diffX = lobDist * dcos(angle);
			diffY = lobDist * dsin(angle);
			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobCharge);
		}
	
		firstTime = false;
	}
} else if (aState == "3") {
	if (current_time >= timeToActivate && current_time < timeToActivate + duration[2]) {
		for (var i = 0; i < 12; i++) {
			instance_create(x + random_range(-offset, offset), y - random_range(-offset, 0), objFireScrap);
		}
	}
} else if (aState == "4") {
	if (current_time >= timeToActivate && firstTime) {
		timeSinceBlast = 0;
			
		for (var i = 0; i < blastAmount; i++) {
			blastAngle = 90 - image_xscale * 90 + blastSpread * i / (blastAmount - 1) - blastSpread / 2;
			instance_create_depth(preciseX, preciseY, thisNumber, objFireShot);
		}
			
		var moveMod = instance_create(0, 0, objMoveMod);
		moveMod.dx = blastRecoilSpd * image_xscale;
		moveMod.ddx = blastRecoilDSpd * image_xscale;
		moveMod.duration = blastRecoilDuration;
		ds_list_add(envMoveModList, moveMod);
		firstTime = false;
	}
	
	timeSinceBlast++;
}

///dmg
scrThisTakeDamage(hp - clientGivenHp);