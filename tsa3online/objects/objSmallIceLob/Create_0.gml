///@desc creation stuff
bigId = depth;
depth = 0;
thisNumber = bigId.thisNumber;
myHeroId = heroId[thisNumber];
dx = (-1 + bigId.i * 2 * 1 / (bigId.smallLobNumber - 1)) * bigId.smallXSpd;
dy = -bigId.dy * bigId.factor;
grav = bigId.grav * bigId.factor;
preciseX = x;
preciseY = y;
hitbox = objSmallIceLobHitbox;