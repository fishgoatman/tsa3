/// @desc creation stuff
var mouseAngle = darctan2(otherY - otherMouseY, otherMouseX - otherX);
angle = mouseAngle + opId.daggerAngle;
dx = daggerSpd * dcos(angle);
dy = daggerSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle + 90;
stickTime = 5 * room_speed;
alarm[0] = stickTime;
//later make alarm start when it hits a block