/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5820CA38
/// @DnDArgument : "code" "///@desc stats$(13_10)if (depth < 0) {$(13_10)	ai = true$(13_10)	depth += 2$(13_10)} else {$(13_10)	ai = false$(13_10)}$(13_10)$(13_10)thisNumber = depth;$(13_10)depth = 0;$(13_10)maxHp = 100;$(13_10)$(13_10)if (thisNumber == 1) {$(13_10)	maxHp *= 1;$(13_10)}$(13_10)$(13_10)moveSpd = 120 / room_speed;$(13_10)jumpPower = 330 / room_speed;$(13_10)grav = 850 / (room_speed * room_speed);$(13_10)airJumps = 0;$(13_10)currAirJumps = 0;$(13_10)bounciness = 0.3;$(13_10)$(13_10)//slash$(13_10)windUp[0] = 0.04 * room_speed;$(13_10)duration[0] = 0.06 * room_speed;$(13_10)windDown[0] = 0.05 * room_speed;$(13_10)slowWindUp[0] = 0.3;$(13_10)slowDuring[0] = 1;$(13_10)slowWindDown[0] = 0.3;$(13_10)cooldown[0] = 1.9 * room_speed;$(13_10)$(13_10)slashDmg = 9;$(13_10)$(13_10)slashBlastAmount = 10;$(13_10)slashBlastSpread = 55;$(13_10)slashBlastCentralAngle = -45;$(13_10)slashBlastAheadDist = 40;$(13_10)slashHitboxDuration = 0.2 * room_speed;$(13_10)$(13_10)//lob$(13_10)windUp[1] = 0.3 * room_speed;$(13_10)duration[1] = 1;$(13_10)windDown[1] = 0.02 * room_speed;$(13_10)slowWindUp[1] = 0.3;$(13_10)slowDuring[1] = 0.7;$(13_10)slowWindDown[1] = 0.3;$(13_10)cooldown[1] = 2.0 * room_speed;$(13_10)$(13_10)lobDmg = 7;$(13_10)$(13_10)maxLobs = 5;$(13_10)lobAngleBetween = 16;$(13_10)lobDist = 16;$(13_10)lobBaseAngle = 37;$(13_10)timePerLobCharge = 0.28 * room_speed;$(13_10)lobSpd = 520 / room_speed;$(13_10)lobHitboxDuration = 0.05 * room_speed;$(13_10)lobGrav = 800 / (room_speed * room_speed);$(13_10)$(13_10)//rocket$(13_10)windUp[2] = 0 * room_speed;$(13_10)duration[2] = 0.35 * room_speed;$(13_10)windDown[2] = 0 * room_speed;$(13_10)slowWindUp[2] = 0.3;$(13_10)slowDuring[2] = 3;$(13_10)slowWindDown[2] = 0;$(13_10)cooldown[2] = 4.1 * room_speed;$(13_10)$(13_10)rocketSpd = 600 / room_speed;$(13_10)rocketDec = rocketSpd / duration[2] / room_speed;$(13_10)particleOffset = 10;$(13_10)$(13_10)//blast$(13_10)windUp[3] = 0.4 * room_speed;$(13_10)duration[3] = 0.2 * room_speed;$(13_10)windDown[3] = 0.35 * room_speed;$(13_10)slowWindUp[3] = 0;$(13_10)slowDuring[3] = 0;$(13_10)slowWindDown[3] = 0;$(13_10)cooldown[3] = 4.3 * room_speed;$(13_10)$(13_10)blastDmgIncrease = 1.6 / room_speed;$(13_10)blastBaseDmg = 1.2;$(13_10)$(13_10)blastAmount = 25;$(13_10)blastSpread = 60;$(13_10)blastSpd = 210 / room_speed;$(13_10)blastTime = 999 * room_speed;$(13_10)blastRecoilSpd = -270 / room_speed;$(13_10)blastRecoilDSpd = 15 / room_speed;$(13_10)blastRecoilDuration = 0.3 * room_speed;$(13_10)blastHitboxDuration = 0.05 * room_speed;$(13_10)$(13_10)if (room == rmMageHelp) {$(13_10)	for (var i = 0; i < 4; i++) {$(13_10)		cooldown[i] = 1$(13_10)	}$(13_10)} else {$(13_10)	if (urf) {$(13_10)		for (var i = 0; i < 4; i++) {$(13_10)			cooldown[i] = 1$(13_10)		}$(13_10)	}$(13_10)}$(13_10)$(13_10)if (ai && aiHalfCooldown) {$(13_10)	for (var i = 0; i < 4; i++) {$(13_10)		cooldown[i] *= 1 / 2$(13_10)	}$(13_10)}"
///@desc stats
if (depth < 0) {
	ai = true
	depth += 2
} else {
	ai = false
}

thisNumber = depth;
depth = 0;
maxHp = 100;

if (thisNumber == 1) {
	maxHp *= 1;
}

moveSpd = 120 / room_speed;
jumpPower = 330 / room_speed;
grav = 850 / (room_speed * room_speed);
airJumps = 0;
currAirJumps = 0;
bounciness = 0.3;

//slash
windUp[0] = 0.04 * room_speed;
duration[0] = 0.06 * room_speed;
windDown[0] = 0.05 * room_speed;
slowWindUp[0] = 0.3;
slowDuring[0] = 1;
slowWindDown[0] = 0.3;
cooldown[0] = 1.9 * room_speed;

slashDmg = 9;

slashBlastAmount = 10;
slashBlastSpread = 55;
slashBlastCentralAngle = -45;
slashBlastAheadDist = 40;
slashHitboxDuration = 0.2 * room_speed;

//lob
windUp[1] = 0.3 * room_speed;
duration[1] = 1;
windDown[1] = 0.02 * room_speed;
slowWindUp[1] = 0.3;
slowDuring[1] = 0.7;
slowWindDown[1] = 0.3;
cooldown[1] = 2.0 * room_speed;

lobDmg = 7;

maxLobs = 5;
lobAngleBetween = 16;
lobDist = 16;
lobBaseAngle = 37;
timePerLobCharge = 0.28 * room_speed;
lobSpd = 520 / room_speed;
lobHitboxDuration = 0.05 * room_speed;
lobGrav = 800 / (room_speed * room_speed);

//rocket
windUp[2] = 0 * room_speed;
duration[2] = 0.35 * room_speed;
windDown[2] = 0 * room_speed;
slowWindUp[2] = 0.3;
slowDuring[2] = 3;
slowWindDown[2] = 0;
cooldown[2] = 4.1 * room_speed;

rocketSpd = 600 / room_speed;
rocketDec = rocketSpd / duration[2] / room_speed;
particleOffset = 10;

//blast
windUp[3] = 0.4 * room_speed;
duration[3] = 0.2 * room_speed;
windDown[3] = 0.35 * room_speed;
slowWindUp[3] = 0;
slowDuring[3] = 0;
slowWindDown[3] = 0;
cooldown[3] = 4.3 * room_speed;

blastDmgIncrease = 1.6 / room_speed;
blastBaseDmg = 1.2;

blastAmount = 25;
blastSpread = 60;
blastSpd = 210 / room_speed;
blastTime = 999 * room_speed;
blastRecoilSpd = -270 / room_speed;
blastRecoilDSpd = 15 / room_speed;
blastRecoilDuration = 0.3 * room_speed;
blastHitboxDuration = 0.05 * room_speed;

if (room == rmMageHelp) {
	for (var i = 0; i < 4; i++) {
		cooldown[i] = 1
	}
} else {
	if (urf) {
		for (var i = 0; i < 4; i++) {
			cooldown[i] = 1
		}
	}
}

if (ai && aiHalfCooldown) {
	for (var i = 0; i < 4; i++) {
		cooldown[i] *= 1 / 2
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 496EA0FF
/// @DnDArgument : "code" "///@desc necessary vars$(13_10)///general$(13_10)hp = maxHp;$(13_10)clientGivenHp = hp;$(13_10)hpLost = 0;$(13_10)preciseX = x;$(13_10)preciseY = y;$(13_10)dx = 0;$(13_10)dy = 0;$(13_10)gravMoveMod = noone;$(13_10)jumpMoveMod = noone;$(13_10)moveModList = ds_list_create(); //affected by cc$(13_10)envMoveModList = ds_list_create(); //not affected by cc$(13_10)slowModList = ds_list_create();$(13_10)dmgModList = ds_list_create();$(13_10)grounded = false;$(13_10)ceilinged = false;$(13_10)timeSinceGrounded = 0$(13_10)$(13_10)///ability$(13_10)aState = "n";$(13_10)clientAState = "n";$(13_10)timeToActivate = 0;$(13_10)aPhase = "n";$(13_10)timeInAPhase = 0;$(13_10)alreadyDone = false;$(13_10)$(13_10)//order: 1 2 3 4$(13_10)for (var i = 0; i < 4; i++) {$(13_10)	cooldownTimer[i] = 0;$(13_10)	firstTime[i] = true;$(13_10)	imageXScale[i] = 1;$(13_10)}$(13_10)$(13_10)abilityKey[0] = "1";$(13_10)abilityKey[1] = "2";$(13_10)abilityKey[2] = "3";$(13_10)abilityKey[3] = "4";$(13_10)numAbilities = 4;$(13_10)timeSinceBlast = 0;$(13_10)numLobs = 0;$(13_10)abilityImageXScale = image_xscale;$(13_10)$(13_10)///key$(13_10)//order: w a s d 1 2 3 4$(13_10)UP = 0;$(13_10)LEFT = 1;$(13_10)DOWN = 2;$(13_10)RIGHT = 3;$(13_10)ONE = 4;$(13_10)TWO = 5;$(13_10)THREE = 6;$(13_10)FOUR = 7;$(13_10)targetX = preciseX$(13_10)$(13_10)for (var i = 0; i < numKeys; i++) {$(13_10)	durationHeld[i] = 0;$(13_10)	heldBefore[i] = false;$(13_10)}$(13_10)$(13_10)maxMouseX = mouse_x;$(13_10)$(13_10)///stuff needed for sprite and image$(13_10)moveState = "none"$(13_10)$(13_10)if (room != rmMageHelp) {$(13_10)	if (selectedHero[thisNumber] == selectedHero[1 - thisNumber] && numberWithSprite2 == thisNumber) {$(13_10)		sprite2 = true$(13_10)	} else {$(13_10)		sprite2 = false$(13_10)	}$(13_10)} else {$(13_10)	sprite2 = false$(13_10)}"
///@desc necessary vars
///general
hp = maxHp;
clientGivenHp = hp;
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
timeSinceGrounded = 0

///ability
aState = "n";
clientAState = "n";
timeToActivate = 0;
aPhase = "n";
timeInAPhase = 0;
alreadyDone = false;

//order: 1 2 3 4
for (var i = 0; i < 4; i++) {
	cooldownTimer[i] = 0;
	firstTime[i] = true;
	imageXScale[i] = 1;
}

abilityKey[0] = "1";
abilityKey[1] = "2";
abilityKey[2] = "3";
abilityKey[3] = "4";
numAbilities = 4;
timeSinceBlast = 0;
numLobs = 0;
abilityImageXScale = image_xscale;

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
targetX = preciseX

for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}

maxMouseX = mouse_x;

///stuff needed for sprite and image
moveState = "none"

if (room != rmMageHelp) {
	if (selectedHero[thisNumber] == selectedHero[1 - thisNumber] && numberWithSprite2 == thisNumber) {
		sprite2 = true
	} else {
		sprite2 = false
	}
} else {
	sprite2 = false
}