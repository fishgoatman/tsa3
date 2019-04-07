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

resets[0] = 0.4 * room_speed
resets[1] = 0.8 * room_speed
resets[2] = 0.8 * room_speed
resets[3] = 1.6 * room_speed
reset = resets[abilityNum]
time = 0.8 * room_speed
selectedHero[abilityNum] = "caster"

for (var i = 0; i < 4; i++) {
	thisInControl[i] = true
}

heroId[abilityNum] = instance_create_depth(x, y, abilityNum, objCasterTP)
currAbility = -1
prevAbility = currAbility