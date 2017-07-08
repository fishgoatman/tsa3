/// @description stats
ddy = 1.1;
jumpDy = 6;
moveSpd = 4.5;
jumpDx = 1;
jumpPreTime = 1;
jumpPostTime = 3;
maxAirJumps = 999;
hp = 1;

///necessary vars
state = NONE;
attackState = NONE;
jumpState = NONE;
abilityState = NONE;
direct = RIGHT;
ducking = false;
spd = moveSpd;
dx = 0;
dy = 0;
preciseX = x;
preciseY = y;
currAirJumps = 0;
isSelectHero = true;
hero = objSelectHeroOP;
lockedIn = false;
upPressed = false;