/// @desc creation stuff
angle = 180 + opId.boltAngle + darctan2(opId.dy, opId.dx);
dx = opId.boltSpd * dcos(angle);
dy = opId.boltSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle + 90;
stickTime = 5 * room_speed;