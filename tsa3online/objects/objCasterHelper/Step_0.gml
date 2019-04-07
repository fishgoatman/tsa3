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
	
	if (currAbility == abilityNum) {
		if (abilityNum == 1) {
			if (abs(time - 0.3 * room_speed) < 1) {
				heroId[abilityNum].durationHeld[5] = 1
				heroId[abilityNum].heldBefore[5] = false
				objTwo.image_index = 1
			}
		} else if (abilityNum == 3) {
			if (abs(time - 1 * room_speed) < 1) {
				heroId[abilityNum].durationHeld[7] = 1
				heroId[abilityNum].heldBefore[7] = false
				objFour.image_index = 1
			}
		}
	}
}

prevAbility = currAbility