/// @description creation stuff
if (mode == "online") {
	instance_create(0, 0, objThisPlayer);
	instance_create(0, 0, objOtherPlayer);
} else if (mode == "offline") {
	instance_create(0, 0, objMousePlayer);
	instance_create(0, 0, objKeyboardPlayer);
}