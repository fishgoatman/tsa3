/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 52936405
/// @DnDArgument : "code" "///@desc settings$(13_10)globalvar hpBarWidth, hpPerLine, hpBarOffset, hpBarHeight, $(13_10)		cooldownOffset, rightControlMode, numPlayers, $(13_10)		selectedHero, lockedIn, heroId, hpBar, playerHandlerObj, $(13_10)		cooldownBar;$(13_10)$(13_10)rightControlMode = "keyboard";$(13_10)room_speed = 60;$(13_10)jumpGrace = 0.1 * room_speed;$(13_10)hpBarWidth = 150;$(13_10)hpPerLine = 12;$(13_10)hpBarOffset = 50;$(13_10)hpBarHeight = 55;$(13_10)cooldownOffset = 20;"
///@desc settings
globalvar hpBarWidth, hpPerLine, hpBarOffset, hpBarHeight, 
		cooldownOffset, rightControlMode, numPlayers, 
		selectedHero, lockedIn, heroId, hpBar, playerHandlerObj, 
		cooldownBar;

rightControlMode = "keyboard";
room_speed = 60;
jumpGrace = 0.1 * room_speed;
hpBarWidth = 150;
hpPerLine = 12;
hpBarOffset = 50;
hpBarHeight = 55;
cooldownOffset = 20;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5B11FB31
/// @DnDArgument : "code" "///@desc necessary vars$(13_10)//player$(13_10)numPlayers = 2;$(13_10)$(13_10)for (var i = 0; i < numPlayers; i++) {$(13_10)	lockedIn[i] = false;$(13_10)}"
///@desc necessary vars
//player
numPlayers = 2;

for (var i = 0; i < numPlayers; i++) {
	lockedIn[i] = false;
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 411EA560
/// @DnDArgument : "code" "///@desc creation stuff$(13_10)window_set_fullscreen(false);$(13_10)texture_set_interpolation(false);"
///@desc creation stuff
window_set_fullscreen(false);
texture_set_interpolation(false);