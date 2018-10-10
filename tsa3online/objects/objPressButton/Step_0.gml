///@desc image_index
if (image_index == 1) {
	time++
	
	if (time >= holdTime) {
		image_index = 0
		time = 0
	}
} else {
	time = 0
}