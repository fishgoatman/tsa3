/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5820CA38
/// @DnDArgument : "code" "///@desc stats$(13_10)if (depth < 0) {$(13_10)	ai = true$(13_10)	depth += 2$(13_10)} else {$(13_10)	ai = false$(13_10)}$(13_10)$(13_10)thisNumber = depth;$(13_10)depth = 0$(13_10)$(13_10)ini_open("casterStats.ini")$(13_10)$(13_10)show_debug_message(ini_read_real("trishot", "windUp", 0))$(13_10)$(13_10)maxHp = 92$(13_10)moveSpd = 120 / room_speed$(13_10)jumpPower = 310 / room_speed$(13_10)grav = 750 / (room_speed * room_speed)$(13_10)airJumps = 0$(13_10)currAirJumps = 0$(13_10)bounciness = 0.25$(13_10)$(13_10)//trishot$(13_10)windUp[0] = 60$(13_10)duration[0] = 80$(13_10)windDown[0] = 50$(13_10)slowWindUp[0] = 1$(13_10)slowDuring[0] = 1$(13_10)slowWindDown[0] = 1$(13_10)cooldown[0] = 800$(13_10)$(13_10)shotSpd = 1200$(13_10)shotAmount = 3$(13_10)shotDist = 10$(13_10)shotXMax = 30$(13_10)shotXMin = 10$(13_10)$(13_10)//lob$(13_10)windUp[1] = 100$(13_10)duration[1] = 30$(13_10)windDown[1] = 100$(13_10)slowWindUp[1] = 0.3$(13_10)slowDuring[1] = 0.7$(13_10)slowWindDown[1] = 0.3$(13_10)cooldown[1] = 3500$(13_10)$(13_10)lobDmg = 13$(13_10)lobSlowTo = 0.4$(13_10)lobSlowDuration = 0.8 * room_speed$(13_10)smallLobDmg = 3$(13_10)smallLobSlowTo = 0.7$(13_10)smallLobSlowDuration = 0.5 * room_speed$(13_10)$(13_10)lobSpd = 850.595$(13_10)lobAngle = 40.857$(13_10)lobDdy = -948.893$(13_10)lobHitboxDuration = 0.05 * room_speed$(13_10)smallLobXSpd = 130$(13_10)lobFactor = 0.4$(13_10)smallLobNumber = 5$(13_10)$(13_10)//teleport$(13_10)windUp[2] = 80$(13_10)duration[2] = 200$(13_10)windDown[2] = 0$(13_10)slowWindUp[2] = 0.3$(13_10)slowDuring[2] = 2.5$(13_10)slowWindDown[2] = 0$(13_10)cooldown[2] = 3400$(13_10)$(13_10)teleportDist = 160$(13_10)$(13_10)//ball$(13_10)windUp[3] = 250$(13_10)duration[3] = 50$(13_10)windDown[3] = 100$(13_10)slowWindUp[3] = 0.3$(13_10)slowDuring[3] = 0.7$(13_10)slowWindDown[3] = 0.3$(13_10)cooldown[3] = 6500$(13_10)$(13_10)ballDmg = 18$(13_10)ballSlowTo = 0.3$(13_10)ballSlowDuration = 0.8 * room_speed$(13_10)$(13_10)ballSpd = 300$(13_10)ballGrav = 421.631$(13_10)ballTriSpd = 220$(13_10)ballTriNum = 18$(13_10)ballTriCreateDist = 20$(13_10)$(13_10)if (room == rmCasterHelp) {$(13_10)	for (var i = 0; i < 4; i++) {$(13_10)		cooldown[i] = 1$(13_10)	}$(13_10)	$(13_10)	cooldown[1] = 400$(13_10)	cooldown[3] = 900$(13_10)} else {$(13_10)	if (urf) {$(13_10)		for (var i = 0; i < 4; i++) {$(13_10)			cooldown[i] = 1$(13_10)		}$(13_10)	}$(13_10)}$(13_10)$(13_10)if (ai && aiHalfCooldown) {$(13_10)	for (var i = 0; i < 4; i++) {$(13_10)		cooldown[i] *= 1 / 2$(13_10)	}$(13_10)}$(13_10)"
///@desc stats
if (depth < 0) {
	ai = true
	depth += 2
} else {
	ai = false
}

thisNumber = depth;
depth = 0

ini_open("casterStats.ini")

show_debug_message(ini_read_real("trishot", "windUp", 0))

maxHp = 92
moveSpd = 120 / room_speed
jumpPower = 310 / room_speed
grav = 750 / (room_speed * room_speed)
airJumps = 0
currAirJumps = 0
bounciness = 0.25

//trishot
windUp[0] = 60
duration[0] = 80
windDown[0] = 50
slowWindUp[0] = 1
slowDuring[0] = 1
slowWindDown[0] = 1
cooldown[0] = 800

shotSpd = 1200
shotAmount = 3
shotDist = 10
shotXMax = 30
shotXMin = 10

//lob
windUp[1] = 100
duration[1] = 30
windDown[1] = 100
slowWindUp[1] = 0.3
slowDuring[1] = 0.7
slowWindDown[1] = 0.3
cooldown[1] = 3500

lobDmg = 13
lobSlowTo = 0.4
lobSlowDuration = 0.8 * room_speed
smallLobDmg = 3
smallLobSlowTo = 0.7
smallLobSlowDuration = 0.5 * room_speed

lobSpd = 850.595
lobAngle = 40.857
lobDdy = -948.893
lobHitboxDuration = 0.05 * room_speed
smallLobXSpd = 130
lobFactor = 0.4
smallLobNumber = 5

//teleport
windUp[2] = 80
duration[2] = 200
windDown[2] = 0
slowWindUp[2] = 0.3
slowDuring[2] = 2.5
slowWindDown[2] = 0
cooldown[2] = 3400

teleportDist = 160

//ball
windUp[3] = 250
duration[3] = 50
windDown[3] = 100
slowWindUp[3] = 0.3
slowDuring[3] = 0.7
slowWindDown[3] = 0.3
cooldown[3] = 6500

ballDmg = 18
ballSlowTo = 0.3
ballSlowDuration = 0.8 * room_speed

ballSpd = 300
ballGrav = 421.631
ballTriSpd = 220
ballTriNum = 18
ballTriCreateDist = 20

if (room == rmCasterHelp) {
	for (var i = 0; i < 4; i++) {
		cooldown[i] = 1
	}
	
	cooldown[1] = 400
	cooldown[3] = 900
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
/// @DnDArgument : "code" "///@desc necessary vars$(13_10)///general$(13_10)hp = maxHp;$(13_10)hpLost = 0;$(13_10)preciseX = x;$(13_10)preciseY = y;$(13_10)dx = 0;$(13_10)dy = 0;$(13_10)gravMoveMod = noone;$(13_10)jumpMoveMod = noone;$(13_10)moveModList = ds_list_create(); //affected by cc$(13_10)envMoveModList = ds_list_create(); //not affected by cc$(13_10)slowModList = ds_list_create();$(13_10)dmgModList = ds_list_create();$(13_10)grounded = false;$(13_10)ceilinged = false;$(13_10)timeSinceGrounded = 0$(13_10)abilityImageXScale = image_xscale;$(13_10)alreadyTp = false$(13_10)$(13_10)///ability$(13_10)aState = "n"$(13_10)clientAState = aState$(13_10)timeToActivate = 0$(13_10)aPhase = "n";$(13_10)timeInAPhase = 0;$(13_10)//order: 1 2 3 4$(13_10)for (var i = 0; i < 4; i++) {$(13_10)	cooldownTime[i] = current_time$(13_10)	firstTime[i] = true$(13_10)}$(13_10)$(13_10)abilityKey[0] = "1";$(13_10)abilityKey[1] = "2";$(13_10)abilityKey[2] = "3";$(13_10)abilityKey[3] = "4";$(13_10)numAbilities = 4;$(13_10)abilitySentNum = 0$(13_10)icebergDirection = 1;$(13_10)numLobs = 0;$(13_10)shadowId = noone;$(13_10)targetX = preciseX$(13_10)lobId = noone$(13_10)ballId = noone$(13_10)aiTime = 0$(13_10)$(13_10)///key$(13_10)//order: w a s d 1 2 3 4$(13_10)UP = 0;$(13_10)LEFT = 1;$(13_10)DOWN = 2;$(13_10)RIGHT = 3;$(13_10)ONE = 4;$(13_10)TWO = 5;$(13_10)THREE = 6;$(13_10)FOUR = 7;$(13_10)$(13_10)for (var i = 0; i < numKeys; i++) {$(13_10)	durationHeld[i] = 0;$(13_10)	heldBefore[i] = false;$(13_10)}$(13_10)$(13_10)maxMouseX = mouse_x;$(13_10)$(13_10)///stuff needed for sprite and image$(13_10)moveState = "none";$(13_10)$(13_10)if (room != rmCasterHelp) {$(13_10)	if (selectedHero[thisNumber] == selectedHero[1 - thisNumber] && numberWithSprite2 == thisNumber) {$(13_10)		sprite2 = true$(13_10)	} else {$(13_10)		sprite2 = false$(13_10)	}$(13_10)} else {$(13_10)	sprite2 = false$(13_10)}"
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
timeSinceGrounded = 0
abilityImageXScale = image_xscale;
alreadyTp = false

///ability
aState = "n"
clientAState = aState
timeToActivate = 0
aPhase = "n";
timeInAPhase = 0;
//order: 1 2 3 4
for (var i = 0; i < 4; i++) {
	cooldownTime[i] = current_time
	firstTime[i] = true
}

abilityKey[0] = "1";
abilityKey[1] = "2";
abilityKey[2] = "3";
abilityKey[3] = "4";
numAbilities = 4;
abilitySentNum = 0
icebergDirection = 1;
numLobs = 0;
shadowId = noone;
targetX = preciseX
lobId = noone
ballId = noone
aiTime = 0

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

for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}

maxMouseX = mouse_x;

///stuff needed for sprite and image
moveState = "none";

if (room != rmCasterHelp) {
	if (selectedHero[thisNumber] == selectedHero[1 - thisNumber] && numberWithSprite2 == thisNumber) {
		sprite2 = true
	} else {
		sprite2 = false
	}
} else {
	sprite2 = false
}