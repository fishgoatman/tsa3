///@desc creation stuff
option = depth
depth = 0
image_speed = 0
image_index = objGeneralNew.optionsColor

if (option == 0) {
	pos = objGeneralNew.soundVolume
} else if (option == 1) {
	pos = objGeneralNew.musicVolume
}

width = sprite_width
leftX = x - width / 2
rightX = x + width / 2
sliderId = instance_create_depth(leftX + pos * width, y, option, objSlider)
pressedSlider = false