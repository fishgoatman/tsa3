/// @desc duration down
if (!forever) {
	duration--;
}

if (duration <= 0) {
	instance_destroy();
}