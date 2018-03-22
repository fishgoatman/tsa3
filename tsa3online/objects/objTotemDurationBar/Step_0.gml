///@desc image_index
if (instance_exists(projId)) {
	image_index = (1 - projId.currTime / projId.time) * image_number;
} else {
	instance_destroy();
}