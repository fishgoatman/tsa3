///@desc sprite
if (room == rmMainMenu) {
	var color = objMainMenuStuff.colors[0]
	
	if (color == 3) {
		sprite_index = sprForestBlock
	} else if (color == 2) {
		sprite_index = sprMountainBlock
	} else if (color == 1) {
		sprite_index = sprTundraBlock
	} else if (color == 0) {
		sprite_index = sprDesertBlock
	}

	image_speed = 0
	image_index = irandom(image_number - 1)
} else {
	if (room == rmForest || room == rmMonkHelp) {
		sprite_index = sprForestBlock
	} else if (room == rmMountain || room == rmRogueHelp) {
		sprite_index = sprMountainBlock
	} else if (room == rmTundra || room == rmCasterHelp) {
		sprite_index = sprTundraBlock
	} else if (room == rmDesert || room == rmMageHelp) {
		sprite_index = sprDesertBlock
	}

	image_speed = 0
	image_index = irandom(image_number - 1)
}