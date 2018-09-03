///@desc sprite
if (room == rmForest) {
	sprite_index = sprForestPlatform
} else if (room == rmMountain) {
	sprite_index = sprMountainPlatform
} else if (room == rmTundra) {
	sprite_index = sprTundraPlatform
} else if (room == rmDesert) {
	sprite_index = sprDesertPlatform
}

image_speed = 0
image_index = irandom(image_number - 1)