///@desc draw instructions
draw_set_halign(fa_center);
var lineOffset = 15;
var startY = 30;
depth = -1;

if (room == rmStartScreen) {
	draw_text(room_width / 2, room_height * 4 / 5, "Press any key")
} else if (room == rmMapSelect) {
	//draw_text(room_width / 2, room_height / 2, "Press the following to select arena: 1 - Bowl 2 - Pillar 3 - Hill 4 - Flat")
}