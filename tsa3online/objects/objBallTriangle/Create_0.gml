///@desc creation stuff
ballId = depth
depth = 0
thisNumber = ballId.thisNumber
angle = ballId.triAngle
preciseX = x
preciseY = y
ix = x
iy = y
dx = ballId.triSpd * dcos(angle)
ddx = 0
dy = ballId.triSpd * dsin(angle)
ddy = ballId.ddy
iTime = current_time
lastTime = current_time
hitbox = objSmallIceLobHitbox