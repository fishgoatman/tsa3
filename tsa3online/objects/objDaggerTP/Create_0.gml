/// @desc creation stuff
angle = tpId.mouseAngle + tpId.boltAngle;
dx = tpId.daggerSpd * dcos(angle);
dy = tpId.daggerSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle + 90;
stickTime = 5 * room_speed;
alarm[0] = stickTime;