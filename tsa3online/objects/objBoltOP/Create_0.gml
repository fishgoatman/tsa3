/// @desc creation stuff
angle = 180 + opId.boltAngle + opId.dashAngle;
dx = boltSpd * dcos(angle);
dy = boltSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle + 90;
stickTime = 5 * room_speed;
createdAlready = false;