///@desc delete grav and jump moveMod
if (instance_exists(gravMoveMod)) {
	gravMoveMod.dy = 0;
}
	
if (instance_exists(jumpMoveMod)) {
	jumpMoveMod.duration = 0;
}