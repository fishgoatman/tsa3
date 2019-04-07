///@desc use abilities
if (mouse_x < room_width / 2) {
	if (mouse_y < room_height / 2) {
		currAbility = 0
	} else {
		currAbility = 2
	}
} else {
	if (mouse_y < room_height / 2) {
		currAbility = 1
	} else {
		currAbility = 3
	}
}

if (prevAbility != currAbility && currAbility == abilityNum) {
	time = reset
}
	
if (abs(time - reset) < 1) {
	heroId[abilityNum].preciseX = startX
	heroId[abilityNum].preciseY = startY
	heroId[abilityNum].image_index = 1
	
	if (currAbility == abilityNum) {
		heroId[abilityNum].durationHeld[abilityNum + 4] = 1
		heroId[abilityNum].heldBefore[abilityNum + 4] = false
	
		if (abilityNum == 0) {
			objOne.image_index = 1
		} else if (abilityNum == 1) {
			objTwo.image_index = 1
		} else if (abilityNum == 2) {
			objThree.image_index = 1
		} else if (abilityNum == 3) {
			objFour.image_index = 1
		}
	}
	
	time = 0
} else {
	time++
	
	for (var i = 0; i < 8; i++) {
		heroId[abilityNum].durationHeld[i] = 0
	}
	
	objLeft.image_index = 0
	objRight.image_index = 0

	if (currAbility == abilityNum) {
		if (abilityNum == 2) {
			var dur = heroId[abilityNum].duration[2]
		
			if (time < dur / 2) {
				heroId[abilityNum].durationHeld[1] = 1
				heroId[abilityNum].heldBefore[1] = false
				objLeft.image_index = 1
			} else if (time < dur) {
				heroId[abilityNum].durationHeld[3] = 1
				heroId[abilityNum].heldBefore[3] = false
				objRight.image_index = 1
			}
		}
	}
}

prevAbility = currAbility