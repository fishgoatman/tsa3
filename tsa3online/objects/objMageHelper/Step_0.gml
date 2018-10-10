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
	
	objLeft.image_index = 0
	objRight.image_index = 0

	if (currAbility == ability) {
		if (ability == 2) {
			var dur = heroId[ability].duration[2]
		
			if (time < dur / 2) {
				heroId[ability].durationHeld[1] = 1
				heroId[ability].heldBefore[1] = false
				objLeft.image_index = 1
			} else if (time < dur) {
				heroId[ability].durationHeld[3] = 1
				heroId[ability].heldBefore[3] = false
				objRight.image_index = 1
			}
		}
	}
}

prevAbility = currAbility