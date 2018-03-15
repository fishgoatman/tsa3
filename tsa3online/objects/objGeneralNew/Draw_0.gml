///@desc draw instructions
draw_set_halign(fa_center);
var lineOffset = 30;
var startY = 60;

if (room == rmCharacterSelectionScreen) {
	draw_text(room_width / 2, startY, "Controls: [RDFG and 1234] [arrow keys and m,./]");
	draw_text(room_width / 2, startY + lineOffset, "Select your hero below by using movement keys");
	draw_text(room_width / 2, startY + 2 * lineOffset, "1 and m to lock in");
	draw_text(room_width / 2, startY + 3 * lineOffset, "I know this menu sucks it is temporary");
}