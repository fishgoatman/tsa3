/// @description stats
oddy = 1.5;
airDdy = 1.2;
jumpDy = 13.5;
flyDy = 1.5;
flyDx = 1.5;
origMoveSpd = 2.7;
fireSpd = 6.4;
attackPreTime = 2;
attackPostTime = 6;
attackSpd = 1;
jumpDx = 1;
jumpPreTime = 1;
jumpPostTime = 3;
maxAirJumps = 0;
hp = 4;
maxShieldHp = 8;
abilityDx = 0;
abilityBaseDy = 1;
shrineTime = 10 * room_speed;
fireTime = 5 * room_speed;
iceTime = 5 * room_speed;
airTime = 5 * room_speed;

///necessary vars
state = NONE;
attackState = NONE;
jumpState = NONE;
abilityState = NONE;
direct = RIGHT;
ducking = false;
moveSpd = origMoveSpd;
spd = moveSpd;
dx = 0;
dy = 0;
ddy = oddy;
preciseX = x;
preciseY = y;
currAirJumps = 0;
immune = false;
immuneTime = IMMUNE_TIME;
abilityChargeTime = 0;
shieldRegainTime = 8 * 30;
shieldHp = maxShieldHp;
fire = false;
ice = false;
air = false;
SHRINE = 5;
REMOVE_POWERUP = 6;
SHIELD = 7;

///creation stuff
//hp bar
hpBarId = instance_create(0, 0, objHpBar);
hpBarId.image_index = hp;

//shield bar
shieldBarId = instance_create(0, 0, objShieldBar);
shieldBarId.image_index = shieldHp;

//shrine
alarm[SHRINE] = shrineTime;

//core
core = instance_create(x, y, objKnightCore);
core.image_index = 0;

//shield
alarm[SHIELD] = shieldRegainTime;

