/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5820CA38
/// @DnDArgument : "code" "///@desc stats$(13_10)thisNumber = depth;$(13_10)depth = 0;$(13_10)maxHp = 84;$(13_10)$(13_10)if (thisNumber == 1) {$(13_10)	maxHp *= 1;$(13_10)}$(13_10)$(13_10)moveSpd = 120 / room_speed;$(13_10)jumpPower = 370 / room_speed;$(13_10)grav = 900 / (room_speed * room_speed);$(13_10)currAirJumps = 0;$(13_10)airJumps = 0;$(13_10)bounciness = 0.2;$(13_10)$(13_10)//crescent punch$(13_10)windUp[0] = 0.15 * room_speed;$(13_10)duration[0] = 0.1 * room_speed;$(13_10)windDown[0] = 0.15 * room_speed;$(13_10)slowWindUp[0] = 0.3;$(13_10)slowDuring[0] = 1;$(13_10)slowWindDown[0] = 0.3;$(13_10)cooldown[0] = 2.4 * room_speed;$(13_10)$(13_10)crescentPunchDmg = 9;$(13_10)$(13_10)crescentPunchSpd = 500 / room_speed;$(13_10)crescentPunchTurnTime = 0.2 * room_speed;$(13_10)crescentPunchPostTurnTime = 999;$(13_10)visualTime = 0.3 * room_speed;$(13_10)$(13_10)//flash kick$(13_10)windUp[1] = 0.05 * room_speed;$(13_10)duration[1] = 0.12 * room_speed;$(13_10)windDown[1] = 0.08 * room_speed;$(13_10)slowWindUp[1] = 0.3;$(13_10)slowDuring[1] = 0.3;$(13_10)slowWindDown[1] = 0.3;$(13_10)cooldown[1] = 1.5 * room_speed;$(13_10)$(13_10)flashKickDmg = 11;$(13_10)$(13_10)kickExtendedDuration = duration[1];$(13_10)$(13_10)//dash$(13_10)windUp[2] = 0.05 * room_speed;$(13_10)duration[2] = 0.2 * room_speed;$(13_10)windDown[2] = 0 * room_speed;$(13_10)slowWindUp[2] = 0.5;$(13_10)slowDuring[2] = 0;$(13_10)slowWindDown[2] = 0.5;$(13_10)cooldown[2] = 2.8 * room_speed;$(13_10)$(13_10)var yFactor = 3;$(13_10)dashXSpd = 1150 / room_speed;$(13_10)dashYSpd = dashXSpd / yFactor;$(13_10)dashDXSpd = -100 / room_speed;$(13_10)dashDYSpd = dashDXSpd / yFactor;$(13_10)dashDuration = duration[2];$(13_10)$(13_10)//thousand palms$(13_10)windUp[3] = 0.32 * room_speed;$(13_10)duration[3] = 0.9 * room_speed;$(13_10)windDown[3] = 0.3 * room_speed;$(13_10)slowWindUp[3] = 0;$(13_10)slowDuring[3] = 0;$(13_10)slowWindDown[3] = 0;$(13_10)cooldown[3] = 5.5 * room_speed;$(13_10)$(13_10)palmDmg = 6;$(13_10)$(13_10)palmSpd = 400 / room_speed;$(13_10)palmDuration = 0.35 * room_speed;$(13_10)palmFreq = 0.12 * room_speed;$(13_10)palmDAngle = 140 / room_speed;$(13_10)palmAngleDiff = 6;$(13_10)palmVisualTime = 0.1 * room_speed;"
///@desc stats
thisNumber = depth;
depth = 0;
maxHp = 84;

if (thisNumber == 1) {
	maxHp *= 1;
}

moveSpd = 120 / room_speed;
jumpPower = 370 / room_speed;
grav = 900 / (room_speed * room_speed);
currAirJumps = 0;
airJumps = 0;
bounciness = 0.2;

//crescent punch
windUp[0] = 0.15 * room_speed;
duration[0] = 0.1 * room_speed;
windDown[0] = 0.15 * room_speed;
slowWindUp[0] = 0.3;
slowDuring[0] = 1;
slowWindDown[0] = 0.3;
cooldown[0] = 2.4 * room_speed;

crescentPunchDmg = 9;

crescentPunchSpd = 500 / room_speed;
crescentPunchTurnTime = 0.2 * room_speed;
crescentPunchPostTurnTime = 999;
visualTime = 0.3 * room_speed;

//flash kick
windUp[1] = 0.05 * room_speed;
duration[1] = 0.12 * room_speed;
windDown[1] = 0.08 * room_speed;
slowWindUp[1] = 0.3;
slowDuring[1] = 0.3;
slowWindDown[1] = 0.3;
cooldown[1] = 1.5 * room_speed;

flashKickDmg = 11;

kickExtendedDuration = duration[1];

//dash
windUp[2] = 0.05 * room_speed;
duration[2] = 0.2 * room_speed;
windDown[2] = 0 * room_speed;
slowWindUp[2] = 0.5;
slowDuring[2] = 0;
slowWindDown[2] = 0.5;
cooldown[2] = 2.8 * room_speed;

var yFactor = 3;
dashXSpd = 1150 / room_speed;
dashYSpd = dashXSpd / yFactor;
dashDXSpd = -100 / room_speed;
dashDYSpd = dashDXSpd / yFactor;
dashDuration = duration[2];

//thousand palms
windUp[3] = 0.32 * room_speed;
duration[3] = 0.9 * room_speed;
windDown[3] = 0.3 * room_speed;
slowWindUp[3] = 0;
slowDuring[3] = 0;
slowWindDown[3] = 0;
cooldown[3] = 5.5 * room_speed;

palmDmg = 6;

palmSpd = 400 / room_speed;
palmDuration = 0.35 * room_speed;
palmFreq = 0.12 * room_speed;
palmDAngle = 140 / room_speed;
palmAngleDiff = 6;
palmVisualTime = 0.1 * room_speed;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 496EA0FF
/// @DnDArgument : "code" "///@desc necessary vars$(13_10)///general$(13_10)hp = maxHp;$(13_10)hpLost = 0;$(13_10)preciseX = x;$(13_10)preciseY = y;$(13_10)gravMoveMod = noone;$(13_10)jumpMoveMod = noone;$(13_10)moveModList = ds_list_create(); //affected by cc$(13_10)envMoveModList = ds_list_create(); //not affected by cc$(13_10)slowModList = ds_list_create();$(13_10)dmgModList = ds_list_create();$(13_10)grounded = false;$(13_10)ceilinged = false;$(13_10)dx = 0;$(13_10)dy = 0;$(13_10)jumpIndicatorId = noone;$(13_10)$(13_10)///ability$(13_10)aState = "n";$(13_10)aPhase = "n";$(13_10)timeInAPhase = 0;$(13_10)//order: 1 2 3 4$(13_10)for (var i = 0; i < 4; i++) {$(13_10)	cooldownTimer[i] = 0;$(13_10)}$(13_10)$(13_10)abilityKey[0] = "1";$(13_10)abilityKey[1] = "2";$(13_10)abilityKey[2] = "3";$(13_10)abilityKey[3] = "4";$(13_10)numAbilities = 4;$(13_10)fist = noone;$(13_10)$(13_10)///key$(13_10)//order: w a s d 1 2 3 4$(13_10)UP = 0;$(13_10)LEFT = 1;$(13_10)DOWN = 2;$(13_10)RIGHT = 3;$(13_10)ONE = 4;$(13_10)TWO = 5;$(13_10)THREE = 6;$(13_10)FOUR = 7;$(13_10)leftKeyOrder[UP] = ord("R");$(13_10)leftKeyOrder[LEFT] = ord("D");$(13_10)leftKeyOrder[DOWN] = ord("F");$(13_10)leftKeyOrder[RIGHT] = ord("G");$(13_10)leftKeyOrder[ONE] = ord("1");$(13_10)leftKeyOrder[TWO] = ord("2");$(13_10)leftKeyOrder[THREE] = ord("3");$(13_10)leftKeyOrder[FOUR] = ord("4");$(13_10)rightKeyOrder[UP] = vk_up;$(13_10)rightKeyOrder[LEFT] = vk_left;$(13_10)rightKeyOrder[DOWN] = vk_down;$(13_10)rightKeyOrder[RIGHT] = vk_right;$(13_10)rightKeyOrder[ONE] = ord("M");$(13_10)rightKeyOrder[TWO] = 188;$(13_10)rightKeyOrder[THREE] = 190;$(13_10)rightKeyOrder[FOUR] = 191;$(13_10)numKeys = 8;$(13_10)$(13_10)for (var i = 0; i < numKeys; i++) {$(13_10)	durationHeld[i] = 0;$(13_10)	heldBefore[i] = false;$(13_10)}$(13_10)$(13_10)maxMouseX = mouse_x;$(13_10)$(13_10)///stuff needed for sprite and image$(13_10)moveState = "none";"
///@desc necessary vars
///general
hp = maxHp;
hpLost = 0;
preciseX = x;
preciseY = y;
gravMoveMod = noone;
jumpMoveMod = noone;
moveModList = ds_list_create(); //affected by cc
envMoveModList = ds_list_create(); //not affected by cc
slowModList = ds_list_create();
dmgModList = ds_list_create();
grounded = false;
ceilinged = false;
dx = 0;
dy = 0;
jumpIndicatorId = noone;

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
fist = noone;

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