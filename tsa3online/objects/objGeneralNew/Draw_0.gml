///@desc draw instructions
draw_set_halign(fa_center);
var lineOffset = 15;
var startY = 30;
depth = -1;

if (room == rmMainMenu) {
	draw_text(room_width / 2, room_height * 4 / 5, "Press space");
} else if (room == rmCharacterSelectionScreen) {
	draw_text(room_width / 2, startY, "Controls: [RDFG and 1234] [arrow keys and m,./]");
	draw_text(room_width / 2, startY + 2 * lineOffset, "1 and m to lock in");
} else if (room == rmMapSelectionScreen) {
	draw_text(room_width / 2, room_height / 2, "Press the following to select arena: 1 - Bowl 2 - Pillar 3 - Hill 4 - Flat");
}