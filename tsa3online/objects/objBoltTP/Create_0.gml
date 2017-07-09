/// @desc creation stuff
angle = tpId.boltAngle + darctan2(tpId.dy, tpId.dx);
dx = tpId.boltSpd * dcos(angle);
dy = tpId.boltSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle - 90;
stickTime = 5 * room_speed;