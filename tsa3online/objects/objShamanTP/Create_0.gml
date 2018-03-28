/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5820CA38
/// @DnDArgument : "code" "///@desc stats$(13_10)thisNumber = depth;$(13_10)depth = 0;$(13_10)maxHp = 105;$(13_10)$(13_10)if (thisNumber == 1) {$(13_10)	maxHp *= 1;$(13_10)}$(13_10)$(13_10)moveSpd = 90 / room_speed;$(13_10)jumpPower = 340 / room_speed;$(13_10)grav = 750 / (room_speed * room_speed);$(13_10)airJumps = 0;$(13_10)currAirJumps = 0;$(13_10)bounciness = 0.3;$(13_10)$(13_10)//lava burst$(13_10)windUp[0] = 0.15 * room_speed;$(13_10)duration[0] = 0.4 * room_speed;$(13_10)windDown[0] = 0.05 * room_speed;$(13_10)slowWindUp[0] = 0.3;$(13_10)slowDuring[0] = 0.1;$(13_10)slowWindDown[0] = 0.3;$(13_10)cooldown[0] = 2 * room_speed;$(13_10)$(13_10)lavaAmountPerTick = 5;$(13_10)lavaDmg = 0.78 / lavaAmountPerTick;$(13_10)lavaDmgIncrease = 0.54 / (room_speed * lavaAmountPerTick);$(13_10)$(13_10)lavaBaseSpd = 250 / room_speed;$(13_10)lavaBaseDx = lavaBaseSpd * 1.1;$(13_10)lavaBaseDy = lavaBaseSpd;$(13_10)lavaDxVar = 20 / room_speed;$(13_10)lavaDyVar = 10 / room_speed;$(13_10)lavaXOff = 15;$(13_10)lavaXVar = 16;$(13_10)lavaYVar = 8;$(13_10)lavaDdy = -12 / room_speed;$(13_10)$(13_10)//call lightning$(13_10)windUp[1] = 0.02 * room_speed;$(13_10)duration[1] = 1;$(13_10)windDown[1] = 0.6 * room_speed;$(13_10)slowWindUp[1] = 0.3;$(13_10)slowDuring[1] = 0;$(13_10)slowWindDown[1] = 0;$(13_10)cooldown[1] = 3.5 * room_speed;$(13_10)$(13_10)lightningDmg = 8;$(13_10)$(13_10)lightningOffset = 30;$(13_10)maxLightningAmount = 10;$(13_10)lightningDuration = 1 * room_speed;$(13_10)lightningInBetweenTime = 0.15 * room_speed;$(13_10)$(13_10)//water jet$(13_10)windUp[2] = 0.1 * room_speed;$(13_10)duration[2] = 0.8 * room_speed;$(13_10)windDown[2] = 0.05 * room_speed;$(13_10)slowWindUp[2] = 0.3;$(13_10)slowDuring[2] = 0;$(13_10)slowWindDown[2] = 0.3;$(13_10)cooldown[2] = 4.1 * room_speed;$(13_10)$(13_10)jetSpd = 400 / room_speed;$(13_10)jetCurrSpd = 0;$(13_10)jetDAngle = 240 / room_speed;$(13_10)jetStartAngle = 90;$(13_10)jetAngle = jetStartAngle;$(13_10)dropTime = 0.3 * room_speed;$(13_10)jetMultiplier = 0.05;$(13_10)dropXVar = 12;$(13_10)dropYVar = 12;$(13_10)dropsPerTick = 7;$(13_10)dropDdy = -30 / room_speed;$(13_10)$(13_10)//totem$(13_10)windUp[3] = 0.2 * room_speed;$(13_10)duration[3] = 1;$(13_10)windDown[3] = 0.05 * room_speed;$(13_10)slowWindUp[3] = 0;$(13_10)slowDuring[3] = 0;$(13_10)slowWindDown[3] = 0;$(13_10)$(13_10)siege = false;$(13_10)$(13_10)if (siege) {$(13_10)	cooldown[3] = 0.1 * room_speed;$(13_10)	totemDuration = 999 * room_speed;$(13_10)} else {$(13_10)	cooldown[3] = 3.6 * room_speed;$(13_10)	totemDuration = 8 * room_speed;$(13_10)}$(13_10)$(13_10)totemIdList = ds_list_create();$(13_10)ds_list_add(totemIdList, id);"
///@desc stats
thisNumber = depth;
depth = 0;
maxHp = 105;

if (thisNumber == 1) {
	maxHp *= 1;
}

moveSpd = 90 / room_speed;
jumpPower = 340 / room_speed;
grav = 750 / (room_speed * room_speed);
airJumps = 0;
currAirJumps = 0;
bounciness = 0.3;

//lava burst
windUp[0] = 0.15 * room_speed;
duration[0] = 0.4 * room_speed;
windDown[0] = 0.05 * room_speed;
slowWindUp[0] = 0.3;
slowDuring[0] = 0.1;
slowWindDown[0] = 0.3;
cooldown[0] = 2 * room_speed;

lavaAmountPerTick = 5;
lavaDmg = 0.78 / lavaAmountPerTick;
lavaDmgIncrease = 0.54 / (room_speed * lavaAmountPerTick);

lavaBaseSpd = 250 / room_speed;
lavaBaseDx = lavaBaseSpd * 1.1;
lavaBaseDy = lavaBaseSpd;
lavaDxVar = 20 / room_speed;
lavaDyVar = 10 / room_speed;
lavaXOff = 15;
lavaXVar = 16;
lavaYVar = 8;
lavaDdy = -12 / room_speed;

//call lightning
windUp[1] = 0.02 * room_speed;
duration[1] = 1;
windDown[1] = 0.6 * room_speed;
slowWindUp[1] = 0.3;
slowDuring[1] = 0;
slowWindDown[1] = 0;
cooldown[1] = 3.5 * room_speed;

lightningDmg = 8;

lightningOffset = 30;
maxLightningAmount = 10;
lightningDuration = 1 * room_speed;
lightningInBetweenTime = 0.15 * room_speed;

//water jet
windUp[2] = 0.1 * room_speed;
duration[2] = 0.8 * room_speed;
windDown[2] = 0.05 * room_speed;
slowWindUp[2] = 0.3;
slowDuring[2] = 0;
slowWindDown[2] = 0.3;
cooldown[2] = 4.1 * room_speed;

jetSpd = 400 / room_speed;
jetCurrSpd = 0;
jetDAngle = 240 / room_speed;
jetStartAngle = 90;
jetAngle = jetStartAngle;
dropTime = 0.3 * room_speed;
jetMultiplier = 0.05;
dropXVar = 12;
dropYVar = 12;
dropsPerTick = 7;
dropDdy = -30 / room_speed;

//totem
windUp[3] = 0.2 * room_speed;
duration[3] = 1;
windDown[3] = 0.05 * room_speed;
slowWindUp[3] = 0;
slowDuring[3] = 0;
slowWindDown[3] = 0;

siege = false;

if (siege) {
	cooldown[3] = 0.1 * room_speed;
	totemDuration = 999 * room_speed;
} else {
	cooldown[3] = 3.6 * room_speed;
	totemDuration = 8 * room_speed;
}

totemIdList = ds_list_create();
ds_list_add(totemIdList, id);

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 496EA0FF
/// @DnDArgument : "code" "///@desc necessary vars$(13_10)///general$(13_10)hp = maxHp;$(13_10)hpLost = 0;$(13_10)preciseX = x;$(13_10)preciseY = y;$(13_10)dx = 0;$(13_10)dy = 0;$(13_10)gravMoveMod = noone;$(13_10)jumpMoveMod = noone;$(13_10)moveModList = ds_list_create(); //affected by cc$(13_10)envMoveModList = ds_list_create(); //not affected by cc$(13_10)slowModList = ds_list_create();$(13_10)dmgModList = ds_list_create();$(13_10)grounded = false;$(13_10)ceilinged = false;$(13_10)$(13_10)///ability$(13_10)aState = "n";$(13_10)aPhase = "n";$(13_10)timeInAPhase = 0;$(13_10)//order: 1 2 3 4$(13_10)for (var i = 0; i < 4; i++) {$(13_10)	cooldownTimer[i] = 0;$(13_10)}$(13_10)$(13_10)abilityKey[0] = "1";$(13_10)abilityKey[1] = "2";$(13_10)abilityKey[2] = "3";$(13_10)abilityKey[3] = "4";$(13_10)numAbilities = 4;$(13_10)timeSinceBlast = 0;$(13_10)numLobs = 0;$(13_10)$(13_10)///key$(13_10)//order: w a s d 1 2 3 4$(13_10)UP = 0;$(13_10)LEFT = 1;$(13_10)DOWN = 2;$(13_10)RIGHT = 3;$(13_10)ONE = 4;$(13_10)TWO = 5;$(13_10)THREE = 6;$(13_10)FOUR = 7;$(13_10)leftKeyOrder[UP] = ord("R");$(13_10)leftKeyOrder[LEFT] = ord("D");$(13_10)leftKeyOrder[DOWN] = ord("F");$(13_10)leftKeyOrder[RIGHT] = ord("G");$(13_10)leftKeyOrder[ONE] = ord("1");$(13_10)leftKeyOrder[TWO] = ord("2");$(13_10)leftKeyOrder[THREE] = ord("3");$(13_10)leftKeyOrder[FOUR] = ord("4");$(13_10)rightKeyOrder[UP] = vk_up;$(13_10)rightKeyOrder[LEFT] = vk_left;$(13_10)rightKeyOrder[DOWN] = vk_down;$(13_10)rightKeyOrder[RIGHT] = vk_right;$(13_10)rightKeyOrder[ONE] = ord("M");$(13_10)rightKeyOrder[TWO] = 188;$(13_10)rightKeyOrder[THREE] = 190;$(13_10)rightKeyOrder[FOUR] = 191;$(13_10)numKeys = 8;$(13_10)$(13_10)for (var i = 0; i < numKeys; i++) {$(13_10)	durationHeld[i] = 0;$(13_10)	heldBefore[i] = false;$(13_10)}$(13_10)$(13_10)maxMouseX = mouse_x;$(13_10)$(13_10)///stuff needed for sprite and image$(13_10)moveState = "none";"
///@desc necessary vars
///general
hp = maxHp;
hpLost = 0;
preciseX = x;
preciseY = y;
dx = 0;
dy = 0;
gravMoveMod = noone;
jumpMoveMod = noone;
moveModList = ds_list_create(); //affected by cc
envMoveModList = ds_list_create(); //not affected by cc
slowModList = ds_list_create();
dmgModList = ds_list_create();
grounded = false;
ceilinged = false;

///ability
aState = "n";
aPhase = "n";
timeInAPhase = 0;
//order: 1 2 3 4
for (var i = 0; i < 4; i++) {
	cooldownTimer[i] = 0;
}

abilityKey[0] = "1";
abilityKey[1] = "2";
abilityKey[2] = "3";
abilityKey[3] = "4";
numAbilities = 4;
timeSinceBlast = 0;
numLobs = 0;

///key
//order: w a s d 1 2 3 4
UP = 0;
LEFT = 1;
DOWN = 2;
RIGHT = 3;
ONE = 4;
TWO = 5;
THREE = 6;
FOUR = 7;
leftKeyOrder[UP] = ord("R");
leftKeyOrder[LEFT] = ord("D");
leftKeyOrder[DOWN] = ord("F");
leftKeyOrder[RIGHT] = ord("G");
leftKeyOrder[ONE] = ord("1");
leftKeyOrder[TWO] = ord("2");
leftKeyOrder[THREE] = ord("3");
leftKeyOrder[FOUR] = ord("4");
rightKeyOrder[UP] = vk_up;
rightKeyOrder[LEFT] = vk_left;
rightKeyOrder[DOWN] = vk_down;
rightKeyOrder[RIGHT] = vk_right;
rightKeyOrder[ONE] = ord("M");
rightKeyOrder[TWO] = 188;
rightKeyOrder[THREE] = 190;
rightKeyOrder[FOUR] = 191;
numKeys = 8;

for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}

maxMouseX = mouse_x;

///stuff needed for sprite and image
moveState = "none";