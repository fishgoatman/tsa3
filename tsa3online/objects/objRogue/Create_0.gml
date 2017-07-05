/// @description stats
ddy = 1.3 * overallSpd;
jumpDy = 17 * overallSpd;
moveSpd = 8 * overallSpd;
attackPreTime = 2 / overallSpd;
attackPostTime = 5 / overallSpd;
climbSpd = 12 * overallSpd;
attackSpd = moveSpd;
jumpDx = 3 * overallSpd;
jumpPreTime = 2 / overallSpd;
jumpPostTime = 4 / overallSpd;
maxAirJumps = 2;
maxHp = 3;
maxKnives = 1;

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
climbing = false;
immune = false;
immuneTime = IMMUNE_TIME;
isSelectHero = false;
hp = maxHp;

