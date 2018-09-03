///@desc turn and destroy
image_angle += dAngle

var collidingId = instance_place(x, y, objPlayer)
	
if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
	instance_create_depth(x, y, id, hitbox)
	createdAlready = true
}

if (currTime >= time) {
	instance_destroy();
}

currTime++;