///get sprite height
var obj = argument0;
height = 0;
var objId = instance_create(0, 0, obj);

with (objId) {
	other.height = sprite_height;
	instance_destroy();
}

return height;