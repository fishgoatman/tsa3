///@desc creation stuff
startX = x
startY = y
preciseX = x
preciseY = y

if (x < room_width / 2) {
	if (y < room_height / 2) {
		ability = 0
	} else {
		ability = 2
	}
} else {
	if (y < room_height / 2) {
		ability = 1
	} else {
		ability = 3
	}
}

resets[0] = 0.4 * room_speed
resets[1] = 0.8 * room_speed
resets[2] = 0.8 * room_speed
resets[3] = 1.6 * room_speed
reset = resets[ability]
time = 0.8 * room_speed
selectedHero[ability] = "caster"

for (var i = 0; i < 4; i++) {
	thisInControl[i] = true
}

handlerId = instance_create_depth(x, y, ability, objPlayerHandler)
currAbility = -1
prevAbility = currAbility