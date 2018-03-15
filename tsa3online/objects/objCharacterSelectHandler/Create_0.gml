/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5B359947
/// @DnDArgument : "code" "///@desc creation stuff$(13_10)gameWasStarted = false;$(13_10)currTime = 0;$(13_10)startGame = false;$(13_10)gameInBetween = false;$(13_10)$(13_10)for (var i = 0; i < numPlayers; i++) {$(13_10)	lockedIn[i] = false;$(13_10)	instance_create_depth(0, 0, i, objCharacterSelecter);$(13_10)}"
///@desc creation stuff
gameWasStarted = false;
currTime = 0;
startGame = false;
gameInBetween = false;

for (var i = 0; i < numPlayers; i++) {
	lockedIn[i] = false;
	instance_create_depth(0, 0, i, objCharacterSelecter);
}