///@desc creation stuff
bigId = depth;
depth = 0;
thisNumber = bigId.thisNumber;
myHeroId = heroId[thisNumber];
dx = (-bigId.dx + bigId.i * 2 * bigId.dx / (bigId.smallLobNumber - 1)) * bigId.factor;
dy = -bigId.dy * bigId.factor;
grav = bigId.grav * bigId.factor;
preciseX = x;
preciseY = y;
hitbox = objSmallIceLobHitbox;