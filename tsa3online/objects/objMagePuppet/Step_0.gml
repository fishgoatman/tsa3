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
	if (aPhase == "u") {
		lobChargeTime = 0;
		numLobs = 0;
	}
	
	if (aPhase == "d") {
		if (numLobs == 0) {
			var angle = lobBaseAngle;
			diffX = lobDist * dcos(angle);
			diffY = lobDist * dsin(angle);
			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobCharge);
			numLobs++;
		}
		
		if (lobChargeTime / timePerLobCharge > numLobs && numLobs < maxLobs) {
			var angleDir = numLobs % 2 == 0 ? -1 : 1;
			var angle = lobBaseAngle + angleDir * lobAngleBetween * floor((numLobs + 1) / 2);
			diffX = lobDist * dcos(angle);
			diffY = lobDist * dsin(angle);
			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobCharge);
			numLobs++;
		}
		
		lobChargeTime++;
	}
} else if (aState == "3") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[2]) {
			var moveMod = instance_create(0, 0, objMoveMod);
			moveMod.dy = rocketSpd;
			moveMod.ddy = -rocketDec;
			moveMod.duration = duration[2];
			ds_list_add(envMoveModList, moveMod);
		}
		
		scrResetAir();
		var offset = 10;
		
		for (var i = 0; i < 12; i++) {
			instance_create(preciseX + random_range(-offset, offset), preciseY - random_range(-offset, 0), objFireScrap);
		}
		
		firstTime[2] = false;
	} else if (aPhase == "w") {
		if (timeInAPhase >= windDown[2] - 1) {
			gravMoveMod.dy = dy;
		}
	}
} else if (aState == "4") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[3]) {
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
			firstTime[3] = false;
		}
	}
	
	timeSinceBlast++;
	scrResetAir();
}

///dmg
scrThisTakeDamage(hp - clientGivenHp);