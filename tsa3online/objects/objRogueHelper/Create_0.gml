///@desc creation stuff
startX = x
startY = y
preciseX = x
preciseY = y

if (x < room_width / 2) {
	if (y < room_height / 2) {
		abilityNum = 0
	} else {
		abilityNum = 2
	}
} else {
	if (y < room_height / 2) {
		abilityNum = 1
	} else {
		abilityNum = 3
	}
}

resets[0] = 0.6 * room_speed
resets[1] = 0.9 * room_speed
resets[2] = 1.5 * room_speed
resets[3] = 1.1 * room_speed
reset = resets[abilityNum]
time = 0.8 * room_speed
selectedHero[abilityNum] = "rogue"

for (var i = 0; i < 4; i++) {
	thisInControl[i] = true
}

heroId[abilityNum] = instance_create_depth(x, y, abilityNum, objRogueTP)
currAbility = -1
prevAbility = currAbility