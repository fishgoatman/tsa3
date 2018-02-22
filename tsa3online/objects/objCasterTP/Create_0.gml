/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5820CA38
/// @DnDArgument : "code" "///@desc stats$(13_10)thisNumber = depth;$(13_10)depth = 0;$(13_10)maxHp = 96;$(13_10)$(13_10)if (thisNumber == 1) {$(13_10)	maxHp *= 1;$(13_10)}$(13_10)$(13_10)moveSpd = 90 / room_speed;$(13_10)jumpPower = 320 / room_speed;$(13_10)grav = 700 / (room_speed * room_speed);$(13_10)airJumps = 0;$(13_10)bounciness = 0.25;$(13_10)$(13_10)//shoot$(13_10)windUp[0] = 0.05 * room_speed;$(13_10)duration[0] = 0.08 * room_speed;$(13_10)windDown[0] = 0.06 * room_speed;$(13_10)slowWindUp[0] = 0.3;$(13_10)slowDuring[0] = 1;$(13_10)slowWindDown[0] = 0.3;$(13_10)cooldown[0] = 0.25 * room_speed;$(13_10)$(13_10)shotDmg = 9;$(13_10)shotSlowTo = 0.65;$(13_10)shotSlowDuration = 0.5 * room_speed;$(13_10)$(13_10)shotSpd = 1000 / room_speed;$(13_10)shotHitboxDuration = 0.05 * room_speed;$(13_10)$(13_10)//lob$(13_10)windUp[1] = 0.05 * room_speed;$(13_10)duration[1] = 1;$(13_10)windDown[1] = 0.05 * room_speed;$(13_10)slowWindUp[1] = 0.3;$(13_10)slowDuring[1] = 0.7;$(13_10)slowWindDown[1] = 0.3;$(13_10)cooldown[1] = 2.6 * room_speed;$(13_10)$(13_10)lobDmg = 10;$(13_10)lobSlowTo = 0.5;$(13_10)lobSlowDuration = 0.8 * room_speed;$(13_10)smallLobDmg = 2.2;$(13_10)smallLobSlowTo = 0.7;$(13_10)smallLobSlowDuration = 0.5 * room_speed;$(13_10)$(13_10)lobSpd = 750 / room_speed;$(13_10)lobAngle = 45;$(13_10)lobGrav = 30 / room_speed;$(13_10)lobHitboxDuration = 0.05 * room_speed;$(13_10)lobFactor = 0.2;$(13_10)smallLobNumber = 5;$(13_10)$(13_10)//teleport$(13_10)windUp[2] = 0.08 * room_speed;$(13_10)duration[2] = 0.2 * room_speed;$(13_10)windDown[2] = 0 * room_speed;$(13_10)slowWindUp[2] = 0.3;$(13_10)slowDuring[2] = 2.5;$(13_10)slowWindDown[2] = 0;$(13_10)cooldown[2] = 3.7 * room_speed;$(13_10)$(13_10)teleportDist = 160;$(13_10)$(13_10)//slow$(13_10)windUp[3] = 0.05 * room_speed;$(13_10)duration[3] = 1;$(13_10)windDown[3] = 0.05 * room_speed;$(13_10)slowWindUp[3] = 0.3;$(13_10)slowDuring[3] = 0.7;$(13_10)slowWindDown[3] = 0.3;$(13_10)cooldown[3] = 6.5 * room_speed;$(13_10)$(13_10)slowDmg = 0.08;$(13_10)slowSlowTo = 0.55;$(13_10)$(13_10)slowOffset = 150;$(13_10)slowHitboxDuration = 2 * room_speed;"
///@desc stats
thisNumber = depth;
depth = 0;
maxHp = 96;

if (thisNumber == 1) {
	maxHp *= 1;
}

moveSpd = 90 / room_speed;
jumpPower = 320 / room_speed;
grav = 700 / (room_speed * room_speed);
airJumps = 0;
bounciness = 0.25;

//shoot
windUp[0] = 0.05 * room_speed;
duration[0] = 0.08 * room_speed;
windDown[0] = 0.06 * room_speed;
slowWindUp[0] = 0.3;
slowDuring[0] = 1;
slowWindDown[0] = 0.3;
cooldown[0] = 0.25 * room_speed;

shotDmg = 9;
shotSlowTo = 0.65;
shotSlowDuration = 0.5 * room_speed;

shotSpd = 1000 / room_speed;
shotHitboxDuration = 0.05 * room_speed;

//lob
windUp[1] = 0.05 * room_speed;
duration[1] = 1;
windDown[1] = 0.05 * room_speed;
slowWindUp[1] = 0.3;
slowDuring[1] = 0.7;
slowWindDown[1] = 0.3;
cooldown[1] = 2.6 * room_speed;

lobDmg = 10;
lobSlowTo = 0.5;
lobSlowDuration = 0.8 * room_speed;
smallLobDmg = 2.2;
smallLobSlowTo = 0.7;
smallLobSlowDuration = 0.5 * room_speed;

lobSpd = 750 / room_speed;
lobAngle = 45;
lobGrav = 30 / room_speed;
lobHitboxDuration = 0.05 * room_speed;
lobFactor = 0.2;
smallLobNumber = 5;

//teleport
windUp[2] = 0.08 * room_speed;
duration[2] = 0.2 * room_speed;
windDown[2] = 0 * room_speed;
slowWindUp[2] = 0.3;
slowDuring[2] = 2.5;
slowWindDown[2] = 0;
cooldown[2] = 3.7 * room_speed;

teleportDist = 160;

//slow
windUp[3] = 0.05 * room_speed;
duration[3] = 1;
windDown[3] = 0.05 * room_speed;
slowWindUp[3] = 0.3;
slowDuring[3] = 0.7;
slowWindDown[3] = 0.3;
cooldown[3] = 6.5 * room_speed;

slowDmg = 0.08;
slowSlowTo = 0.55;

slowOffset = 150;
slowHitboxDuration = 2 * room_speed;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 496EA0FF
/// @DnDArgument : "code" "///@desc necessary vars$(13_10)///general$(13_10)hp = maxHp;$(13_10)hpLost = 0;$(13_10)preciseX = x;$(13_10)preciseY = y;$(13_10)dx = 0;$(13_10)dy = 0;$(13_10)gravMoveMod = noone;$(13_10)jumpMoveMod = noone;$(13_10)moveModList = ds_list_create(); //affected by cc$(13_10)envMoveModList = ds_list_create(); //not affected by cc$(13_10)slowModList = ds_list_create();$(13_10)dmgModList = ds_list_create();$(13_10)grounded = false;$(13_10)ceilinged = false;$(13_10)$(13_10)///ability$(13_10)aState = "n";$(13_10)aPhase = "n";$(13_10)timeInAPhase = 0;$(13_10)//order: 1 2 3 4$(13_10)for (var i = 0; i < 4; i++) {$(13_10)	cooldownTimer[i] = 0;$(13_10)}$(13_10)$(13_10)abilityKey[0] = "1";$(13_10)abilityKey[1] = "2";$(13_10)abilityKey[2] = "3";$(13_10)abilityKey[3] = "4";$(13_10)numAbilities = 4;$(13_10)icebergDirection = 1;$(13_10)numLobs = 0;$(13_10)$(13_10)///key$(13_10)//order: w a s d 1 2 3 4$(13_10)UP = 0;$(13_10)LEFT = 1;$(13_10)DOWN = 2;$(13_10)RIGHT = 3;$(13_10)ONE = 4;$(13_10)TWO = 5;$(13_10)THREE = 6;$(13_10)FOUR = 7;$(13_10)leftKeyOrder[UP] = ord("R");$(13_10)leftKeyOrder[LEFT] = ord("D");$(13_10)leftKeyOrder[DOWN] = ord("F");$(13_10)leftKeyOrder[RIGHT] = ord("G");$(13_10)leftKeyOrder[ONE] = ord("1");$(13_10)leftKeyOrder[TWO] = ord("2");$(13_10)leftKeyOrder[THREE] = ord("3");$(13_10)leftKeyOrder[FOUR] = ord("4");$(13_10)rightKeyOrder[UP] = vk_up;$(13_10)rightKeyOrder[LEFT] = vk_left;$(13_10)rightKeyOrder[DOWN] = vk_down;$(13_10)rightKeyOrder[RIGHT] = vk_right;$(13_10)rightKeyOrder[ONE] = ord("M");$(13_10)rightKeyOrder[TWO] = 188;$(13_10)rightKeyOrder[THREE] = 190;$(13_10)rightKeyOrder[FOUR] = 191;$(13_10)numKeys = 8;$(13_10)$(13_10)for (var i = 0; i < numKeys; i++) {$(13_10)	durationHeld[i] = 0;$(13_10)	heldBefore[i] = false;$(13_10)}$(13_10)$(13_10)maxMouseX = mouse_x;$(13_10)$(13_10)///stuff needed for sprite and image$(13_10)moveState = "none";"
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
icebergDirection = 1;
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