///@desc creation stuff
ballId = depth;
depth = 0;
thisNumber = ballId.thisNumber;
angle = ballId.triAngle
dx = ballId.triSpd * dcos(angle)
dy = ballId.triSpd * dsin(angle)
grav = ballId.grav;
preciseX = x;
preciseY = y;
hitbox = objInertTriangleHitbox;