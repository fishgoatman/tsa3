///@desc draw instructions
draw_set_halign(fa_center);
var lineOffset = 15;
var startY = 30;

if (room == rmCharacterSelectionScreen) {
	depth = -1;
	draw_text(room_width / 2, startY, "Controls: [RDFG and 1234] [arrow keys and m,./]");
	draw_text(room_width / 2, startY + 2 * lineOffset, "1 and m to lock in");
}