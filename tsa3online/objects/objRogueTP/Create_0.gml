/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7D2B14B0
/// @DnDArgument : "code" "///@desc stats$(13_10)ddy = 1.3 * overallSpd;$(13_10)jumpDy = 17 * overallSpd;$(13_10)moveSpd = 8 * overallSpd;$(13_10)attackPreTime = 2 / overallSpd;$(13_10)attackPostTime = 15 / overallSpd;$(13_10)climbSpd = 12 * overallSpd;$(13_10)attackSpd = moveSpd;$(13_10)jumpDx = 3 * overallSpd;$(13_10)jumpPreTime = 2 / overallSpd;$(13_10)jumpPostTime = 4 / overallSpd;$(13_10)maxAirJumps = 1;$(13_10)maxHp = 3;$(13_10)maxKnives = 1;$(13_10)dashSpd = 22;$(13_10)dashTime = 4;$(13_10)dashCooldownTime = 3 * room_speed / overallSpd;$(13_10)dashBoltAmount = 10;$(13_10)dashBoltSpread = 30;$(13_10)dashBoltSpd = 20;$(13_10)startAngle = 100;$(13_10)endAngle = 8;$(13_10)dAngle = -10;$(13_10)daggerAmount = 10;$(13_10)daggerSpd = 50;"
///@desc stats
ddy = 1.3 * overallSpd;
jumpDy = 17 * overallSpd;
moveSpd = 8 * overallSpd;
attackPreTime = 2 / overallSpd;
attackPostTime = 15 / overallSpd;
climbSpd = 12 * overallSpd;
attackSpd = moveSpd;
jumpDx = 3 * overallSpd;
jumpPreTime = 2 / overallSpd;
jumpPostTime = 4 / overallSpd;
maxAirJumps = 1;
maxHp = 3;
maxKnives = 1;
dashSpd = 22;
dashTime = 4;
dashCooldownTime = 3 * room_speed / overallSpd;
dashBoltAmount = 10;
dashBoltSpread = 30;
dashBoltSpd = 20;
startAngle = 100;
endAngle = 8;
dAngle = -10;
daggerAmount = 10;
daggerSpd = 50;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 059E7D8B
/// @DnDArgument : "code" "///@desc necessary vars$(13_10)state = NONE;$(13_10)attackState = NONE;$(13_10)jumpState = NONE;$(13_10)abilityState = NONE;$(13_10)direct = RIGHT;$(13_10)ducking = false;$(13_10)spd = moveSpd;$(13_10)dx = 0;$(13_10)dy = 0;$(13_10)preciseX = x;$(13_10)preciseY = y;$(13_10)currAirJumps = 0;$(13_10)climbing = false;$(13_10)immune = false;$(13_10)immuneTime = IMMUNE_TIME;$(13_10)isSelectHero = false;$(13_10)hp = maxHp;$(13_10)upPressed = false;$(13_10)upHeld = false;$(13_10)dashing = false;$(13_10)dashReady = true;$(13_10)DASH = 4;$(13_10)DASH_COOLDOWN = 5;$(13_10)currAngle = startAngle;$(13_10)charging = false;"
///@desc necessary vars
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
upPressed = false;
upHeld = false;
dashing = false;
dashReady = true;
DASH = 4;
DASH_COOLDOWN = 5;
currAngle = startAngle;
charging = false;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2027F514
/// @DnDArgument : "code" "///@desc creation stuff$(13_10)instance_create(preciseX, preciseY, objRogueDashIndicator);"
///@desc creation stuff
instance_create(preciseX, preciseY, objRogueDashIndicator);