/// @description stats
ddy = 1.5 * overallSpd;
jumpDy = 18 * overallSpd;
flyDy = 3 * overallSpd;
flyDx = 3 * overallSpd;
moveSpd = 5.5 * overallSpd;
attackPreTime = 4 / overallSpd;
attackPostTime = 16 / overallSpd;
attackSpd = 1 * overallSpd;
jumpDx = moveSpd;
jumpPreTime = 1 / overallSpd;
jumpPostTime = 1 / overallSpd;
maxAirJumps = 0;
windDdy = 6;
maxWindDy = 18;
windTime = 1 * room_speed / overallSpd;
totemCooldown = 1.4 * room_speed / overallSpd;
windCooldown = 2.4 * room_speed / overallSpd;
lightningCooldown = 4.5 * room_speed / overallSpd;
fireCooldown = 3.8 * room_speed / overallSpd;

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
immune = false;
immuneTime = IMMUNE_TIME;
isSelectHero = false;
maxHp = shamanHp;
hp = maxHp;
totemReady = true;
lightningReady = true;
windReady = true;
fireReady = true;
threeState = NONE;
fourState = NONE;
TOTEM = 1;
LIGHTNING = 2;
onePressed = false;
twoPressed = false;
threePressed = false;
fourPressed = false;
ducking = false;
upPressed = false;
upHeld = false;
controlScheme = "keyboard";
scrHeroId();

///creation stuff
alarm[1] = 1;