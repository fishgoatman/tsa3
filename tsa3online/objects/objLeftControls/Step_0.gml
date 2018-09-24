///@desc stop blinking
if (time > 2 * room_speed) {
	image_speed = 0
	image_index = 0
} else {
	time++
}