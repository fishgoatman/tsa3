///@desc creation stuff
if (time >= reset) {
	preciseX = startX
	preciseY = startY
	image_index = 1
	time = 0
	heroId[ability].durationHeld[ability + 4] = 1
	heroId[ability].heldBefore[ability + 4] = false
} else {
	time++
	heroId[ability].durationHeld[ability + 4] = 0
}