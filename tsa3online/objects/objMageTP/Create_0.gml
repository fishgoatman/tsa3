/// @description creation stuff
//stats
ddy = 1.2 * overallSpd;
jumpDy = 15 * overallSpd;
floatDy = 3.5 * overallSpd;
floatDx = 3.8 * overallSpd;
moveSpd = 5.4 * overallSpd;
attackPreTime = 2 / overallSpd;
attackPostTime = 12 / overallSpd;
attackSpd = 1 * overallSpd;
jumpDx = 1 * overallSpd;
jumpPreTime = 1 / overallSpd;
jumpPostTime = 3 / overallSpd;
maxAirJumps = 0;
maxHp = mageHp;

//necessary vars
state = NONE;
attackState = NONE;
mageAttackState = NONE;
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
immune = false;
immuneTime = IMMUNE_TIME;
isSelectHero = false;
hp = maxHp;
allExplode = false;
MAGE = 1;
DRAGON = -1;
firingMode = MAGE;
changeReady = true;
CHANGE = 5;
changeCDTime = 30;
upPressed = false;
immuneTo = ds_list_create();