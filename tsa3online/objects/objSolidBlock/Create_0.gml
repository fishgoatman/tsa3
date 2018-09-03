///@desc sprite
if (room == rmForest) {
	sprite_index = sprForestBlock
} else if (room == rmMountain) {
	sprite_index = sprMountainBlock
} else if (room == rmTundra) {
	sprite_index = sprTundraBlock
} else if (room == rmDesert) {
	sprite_index = sprDesertBlock
}

image_speed = 0
image_index = irandom(image_number - 1)