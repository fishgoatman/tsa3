///layout
instance_create(room_width / 2, room_height / 2, objBorder);

with (objBlock) {
	instance_create(room_width - x, y, object_index);
}

with (objPlatform) {
	instance_create(room_width - x, y, object_index);
}