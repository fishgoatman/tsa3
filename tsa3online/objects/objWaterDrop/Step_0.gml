///@desc move and destroy
dy += ddy;
scrMove();

if (currTime >= time) {
	instance_destroy();
}

currTime++;