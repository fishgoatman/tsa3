///@desc test
if (keyboard_check_direct(vk_anykey)) {
	show_debug_message(string(keyboard_lastkey));
}