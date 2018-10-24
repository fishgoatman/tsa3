///@desc draw controls
for (var i = 0; i < numKeys; i++) {
	draw_text(50 + i * 50, 50, scrKeyToString(leftControls[i]))
	draw_text(50 + i * 50, 100, scrKeyToString(rightControls[i]))
}