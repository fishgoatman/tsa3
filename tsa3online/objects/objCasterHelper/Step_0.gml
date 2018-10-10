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

if (prevAbility != currAbility && currAbility == ability) {
	time = reset
}
	
if (abs(time - reset) < 1) {
	heroId[ability].preciseX = startX
	heroId[ability].preciseY = startY
	heroId[ability].image_index = 1
	
	if (currAbility == ability) {
		heroId[ability].durationHeld[ability + 4] = 1
		heroId[ability].heldBefore[ability + 4] = false
	
		if (ability == 0) {
			objOne.image_index = 1
		} else if (ability == 1) {
			objTwo.image_index = 1
		} else if (ability == 2) {
			objThree.image_index = 1
		} else if (ability == 3) {
			objFour.image_index = 1
		}
	}
	
	time = 0
} else {
	time++
	
	for (var i = 0; i < 8; i++) {
		heroId[ability].durationHeld[i] = 0
	}
	
	if (currAbility == ability) {
		if (ability == 1) {
			if (abs(time - 0.3 * room_speed) < 1) {
				heroId[ability].durationHeld[5] = 1
				heroId[ability].heldBefore[5] = false
				objTwo.image_index = 1
			}
		} else if (ability == 3) {
			if (abs(time - 1 * room_speed) < 1) {
				heroId[ability].durationHeld[7] = 1
				heroId[ability].heldBefore[7] = false
				objFour.image_index = 1
			}
		}
	}
}

prevAbility = currAbility