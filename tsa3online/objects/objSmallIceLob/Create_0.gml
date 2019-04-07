///@desc creation stuff
bigId = depth
depth = 0
thisNumber = bigId.thisNumber
myHeroId = heroId[thisNumber]
dx = (-1 + bigId.i * 2 * 1 / (bigId.smallLobNumber - 1)) * bigId.smallXSpd
ddx = 0
dy = -(-bigId.yChange) * room_speed * bigId.factor
ddy = bigId.ddy * bigId.factor
preciseX = x;
preciseY = y;
ix = x
iy = y
iTime = current_time
lastTime = current_time
hitbox = objSmallIceLobHitbox