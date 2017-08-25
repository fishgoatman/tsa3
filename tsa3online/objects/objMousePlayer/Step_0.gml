/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4669D4DA
/// @DnDArgument : "code" "///@desc get input$(13_10)if (instance_exists(mpId)) {$(13_10)	if (mouseAi == "rogue") {$(13_10)		scrAiRogueGetInput();$(13_10)	} else if (mouseAi == "monk") {$(13_10)		scrAiMonkGetInput();$(13_10)	} else {$(13_10)		scrMouseGetInput();$(13_10)	}$(13_10)} else {$(13_10)    instance_destroy();$(13_10)}$(13_10)$(13_10)mask_index = object_get_sprite(hero);"
///@desc get input
if (instance_exists(mpId)) {
	if (mouseAi == "rogue") {
		scrAiRogueGetInput();
	} else if (mouseAi == "monk") {
		scrAiMonkGetInput();
	} else {
		scrMouseGetInput();
	}
} else {
    instance_destroy();
}

mask_index = object_get_sprite(hero);