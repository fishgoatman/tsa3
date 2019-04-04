///@desc move the slider
if (mouse_check_button_pressed(mb_left)) {
	with (sliderId) {
		var pixelId = instance_create_depth(mouse_x, mouse_y, 0, objPixel)
	
		if (instance_place(x, y, objPixel) == pixelId) {
			other.pressedSlider = true
		}
		
		with (pixelId) {
			instance_destroy()
		}
	}
}

if (mouse_check_button(mb_left)) {
	if (pressedSlider) {
		if (mouse_x < leftX) {
			sliderId.x = leftX
		} else if (mouse_x > rightX) {
			sliderId.x = rightX
		} else {
			sliderId.x = mouse_x
		}
		
		var newPos = (sliderId.x - leftX) / width
		
		if (option == 0) {
			objGeneralNew.soundVolume = newPos
		} else if (option == 1) {
			objGeneralNew.musicVolume = newPos
		}
	}
} else {
	pressedSlider = false
}