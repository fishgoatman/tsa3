/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 52936405
/// @DnDArgument : "code" "///@desc settings$(13_10)globalvar hpBarWidth, hpPerLine, hpBarOffset, hpBarHeight, $(13_10)		cooldownOffset, rightControlMode, numPlayers, $(13_10)		selectedHero, lockedIn, heroId, hpBar, playerHandlerObj, $(13_10)		cooldownBar, startGameDelay, characterSelect, selectBoxes,$(13_10)		parameters;$(13_10)$(13_10)rightControlMode = "keyboard";$(13_10)room_speed = 60;$(13_10)jumpGrace = 0.1 * room_speed;$(13_10)hpBarWidth = 150;$(13_10)hpPerLine = 12;$(13_10)hpBarOffset = 50;$(13_10)hpBarHeight = 55;$(13_10)cooldownOffset = 20;$(13_10)numPlayers = 2;$(13_10)startGameDelay = 0.75 * room_speed;$(13_10)characterSelect[0, 0] = "mage";$(13_10)characterSelect[0, 1] = "caster";$(13_10)characterSelect[0, 2] = "rogue";$(13_10)selectBoxes[0, 0] = objMageSelection;$(13_10)selectBoxes[0, 1] = objCasterSelection;$(13_10)selectBoxes[0, 2] = objRogueSelection;"
///@desc settings
globalvar hpBarWidth, hpPerLine, hpBarOffset, hpBarHeight, 
		cooldownOffset, rightControlMode, numPlayers, 
		selectedHero, lockedIn, heroId, hpBar, playerHandlerObj, 
		cooldownBar, startGameDelay, characterSelect, selectBoxes,
		parameters;

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
selectBoxes[0, 0] = objMageSelection;
selectBoxes[0, 1] = objCasterSelection;
selectBoxes[0, 2] = objRogueSelection;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5B11FB31
/// @DnDArgument : "code" "///@desc necessary vars"
///@desc necessary vars

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 411EA560
/// @DnDArgument : "code" "///@desc creation stuff$(13_10)randomize();$(13_10)window_set_fullscreen(false);$(13_10)texture_set_interpolation(false);$(13_10)$(13_10)for (var i = 0; i < numPlayers; i++) {$(13_10)	lockedIn[i] = false;$(13_10)}"
///@desc creation stuff
randomize();
window_set_fullscreen(false);
texture_set_interpolation(false);

for (var i = 0; i < numPlayers; i++) {
	lockedIn[i] = false;
}