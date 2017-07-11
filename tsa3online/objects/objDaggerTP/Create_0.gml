/// @desc creation stuff
angle = tpId.mouseAngle + tpId.daggerAngle;
dx = daggerSpd * dcos(angle);
dy = daggerSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle + 90;
stickTime = 5 * room_speed;
alarm[0] = stickTime;
//later make alarm start when it hits a block