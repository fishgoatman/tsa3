/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 52936405
/// @DnDArgument : "code" "///@desc settings$(13_10)globalvar hpBarWidth, hpPerLine, hpBarOffset, hpBarHeight, $(13_10)		cooldownOffset, rightControlMode, numPlayers, $(13_10)		selectedHero, lockedIn, heroId, hpBar, playerHandlerObj, $(13_10)		cooldownBar, startGameDelay, characterSelect, selectBoxes,$(13_10)		auto;$(13_10)$(13_10)rightControlMode = "keyboard";$(13_10)room_speed = 60;$(13_10)jumpGrace = 0.1 * room_speed;$(13_10)hpBarWidth = 150;$(13_10)hpPerLine = 12;$(13_10)hpBarOffset = 50;$(13_10)hpBarHeight = 55;$(13_10)cooldownOffset = 20;$(13_10)numPlayers = 2;$(13_10)startGameDelay = 0.75 * room_speed;$(13_10)characterSelect[0, 0] = "mage";$(13_10)characterSelect[0, 1] = "caster";$(13_10)characterSelect[0, 2] = "rogue";$(13_10)characterSelect[1, 0] = "shaman";$(13_10)characterSelect[1, 1] = "monk";$(13_10)characterSelect[1, 2] = "random";$(13_10)selectBoxes[0, 0] = objMageSelection;$(13_10)selectBoxes[0, 1] = objCasterSelection;$(13_10)selectBoxes[0, 2] = objRogueSelection;$(13_10)selectBoxes[1, 0] = objShamanSelection;$(13_10)selectBoxes[1, 1] = objMonkSelection;$(13_10)selectBoxes[1, 2] = objRandomSelection;$(13_10)debug = false;$(13_10)auto = false;$(13_10)$(13_10)///depths$(13_10)globalvar uiDepth;$(13_10)uiDepth = 1;"
///@desc settings
globalvar hpBarWidth, hpPerLine, hpBarOffset, hpBarHeight, 
		cooldownOffset, rightControlMode, numPlayers, 
		selectedHero, lockedIn, heroId, hpBar, playerHandlerObj, 
		cooldownBar, startGameDelay, characterSelect, selectBoxes,
		auto;

rightControlMode = "keyboard";
room_speed = 60;
jumpGrace = 0.1 * room_speed;
hpBarWidth = 150;
hpPerLine = 12;
hpBarOffset = 50;
hpBarHeight = 55;
cooldownOffset = 20;
numPlayers = 2;
startGameDelay = 0.75 * room_speed;
characterSelect[0, 0] = "mage";
characterSelect[0, 1] = "caster";
characterSelect[0, 2] = "rogue";
characterSelect[1, 0] = "shaman";
characterSelect[1, 1] = "monk";
characterSelect[1, 2] = "random";
selectBoxes[0, 0] = objMageSelection;
selectBoxes[0, 1] = objCasterSelection;
selectBoxes[0, 2] = objRogueSelection;
selectBoxes[1, 0] = objShamanSelection;
selectBoxes[1, 1] = objMonkSelection;
selectBoxes[1, 2] = objRandomSelection;
debug = false;
auto = false;

///depths
globalvar uiDepth;
uiDepth = 1;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5B11FB31
/// @DnDArgument : "code" "///@desc necessary vars$(13_10)currRoom = "main";$(13_10)targetRoom = "main";$(13_10)startOffline = false;$(13_10)startOnline = false;$(13_10)createGameStuff = false;$(13_10)createSelectStuff = false;$(13_10)globalvar thisInControl;$(13_10)$(13_10)for (var i = 0; i < numPlayers; i++) {$(13_10)	thisInControl[i] = false;$(13_10)}"
///@desc necessary vars
currRoom = "main";
targetRoom = "main";
startOffline = false;
startOnline = false;
createGameStuff = false;
createSelectStuff = false;
globalvar thisInControl;

for (var i = 0; i < numPlayers; i++) {
	thisInControl[i] = false;
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 411EA560
/// @DnDArgument : "code" "///@desc creation stuff$(13_10)randomize();$(13_10)$(13_10)if (!debug) {$(13_10)	window_set_fullscreen(true);$(13_10)}$(13_10)$(13_10)texture_set_interpolation(false);"
///@desc creation stuff
randomize();

if (!debug) {
	window_set_fullscreen(true);
}

texture_set_interpolation(false);