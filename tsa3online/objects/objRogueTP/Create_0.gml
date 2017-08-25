/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7D2B14B0
/// @DnDArgument : "code" "///@desc stats$(13_10)ddy = 1.3 * overallSpd;$(13_10)jumpDy = 15 * overallSpd;$(13_10)moveSpd = 7.5 * overallSpd;$(13_10)attackPreTime = 3 / overallSpd;$(13_10)attackPostTime = 12 / overallSpd;$(13_10)climbSpd = 10 * overallSpd;$(13_10)attackSpd = moveSpd;$(13_10)jumpDx = 3 * overallSpd;$(13_10)jumpPreTime = 2 / overallSpd;$(13_10)jumpPostTime = 4 / overallSpd;$(13_10)maxAirJumps = 1;$(13_10)maxHp = rogueHp;$(13_10)maxKnives = 1;$(13_10)dashSpd = 14;$(13_10)dashTime = 4;$(13_10)dashCooldownTime = 2.5 * room_speed / overallSpd;$(13_10)frictionDx = 1.5;$(13_10)startAngle = 120;$(13_10)endAngle = 2;$(13_10)dAngle = -9;"
///@desc stats
ddy = 1.3 * overallSpd;
jumpDy = 15 * overallSpd;
moveSpd = 7.5 * overallSpd;
attackPreTime = 3 / overallSpd;
attackPostTime = 12 / overallSpd;
climbSpd = 10 * overallSpd;
attackSpd = moveSpd;
jumpDx = 3 * overallSpd;
jumpPreTime = 2 / overallSpd;
jumpPostTime = 4 / overallSpd;
maxAirJumps = 1;
maxHp = rogueHp;
maxKnives = 1;
dashSpd = 14;
dashTime = 4;
dashCooldownTime = 2.5 * room_speed / overallSpd;
frictionDx = 1.5;
startAngle = 120;
endAngle = 2;
dAngle = -9;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 059E7D8B
/// @DnDArgument : "code" "///@desc necessary vars$(13_10)state = NONE;$(13_10)attackState = NONE;$(13_10)jumpState = NONE;$(13_10)abilityState = NONE;$(13_10)direct = RIGHT;$(13_10)spd = moveSpd;$(13_10)moveDx = 0;$(13_10)naturalDx = 0;$(13_10)moveDy = 0;$(13_10)naturalDy = 0;$(13_10)dx = 0;$(13_10)dy = 0;$(13_10)preciseX = x;$(13_10)preciseY = y;$(13_10)currAirJumps = 0;$(13_10)climbing = false;$(13_10)immune = false;$(13_10)immuneTime = IMMUNE_TIME;$(13_10)isSelectHero = false;$(13_10)hp = maxHp;$(13_10)dashing = false;$(13_10)dashReady = true;$(13_10)DASH = 4;$(13_10)DASH_COOLDOWN = 5;$(13_10)currAngle = startAngle;$(13_10)charging = false;$(13_10)immuneTo = ds_list_create();$(13_10)immuneToThisTick = ds_list_create();$(13_10)upPressed = false;$(13_10)upHeld = false;$(13_10)onePressed = false;$(13_10)oneReleased = false;$(13_10)twoPressed = false;$(13_10)threePressed = false;$(13_10)fourPressed = false;$(13_10)ducking = false;$(13_10)controlScheme = rogueControlScheme;$(13_10)stunTime = 0;$(13_10)slowTimes = ds_list_create();$(13_10)slowTos = ds_list_create();$(13_10)slowIds = ds_list_create();$(13_10)tMouseX = mouse_x;$(13_10)tMouseY = mouse_y;$(13_10)randoMoveTime = 0;"
///@desc necessary vars
state = NONE;
attackState = NONE;
jumpState = NONE;
abilityState = NONE;
direct = RIGHT;
spd = moveSpd;
moveDx = 0;
naturalDx = 0;
moveDy = 0;
naturalDy = 0;
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
dashing = false;
dashReady = true;
DASH = 4;
DASH_COOLDOWN = 5;
currAngle = startAngle;
charging = false;
immuneTo = ds_list_create();
immuneToThisTick = ds_list_create();
upPressed = false;
upHeld = false;
onePressed = false;
oneReleased = false;
twoPressed = false;
threePressed = false;
fourPressed = false;
ducking = false;
controlScheme = rogueControlScheme;
stunTime = 0;
slowTimes = ds_list_create();
slowTos = ds_list_create();
slowIds = ds_list_create();
tMouseX = mouse_x;
tMouseY = mouse_y;
randoMoveTime = 0;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2027F514
/// @DnDArgument : "code" "///@desc creation stuff$(13_10)instance_create(preciseX, preciseY, objRogueDashIndicator);"
///@desc creation stuff
instance_create(preciseX, preciseY, objRogueDashIndicator);