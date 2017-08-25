/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4669D4DA
/// @DnDArgument : "code" "///@desc get input$(13_10)if (instance_exists(kpId)) {$(13_10)	if (keyboardAi == "mage") {$(13_10)		scrAiMageGetInput();$(13_10)	} else {$(13_10)		scrKeyboardGetInput();$(13_10)	}$(13_10)} else {$(13_10)    instance_destroy();$(13_10)}$(13_10)$(13_10)mask_index = object_get_sprite(hero);"
///@desc get input
if (instance_exists(kpId)) {
	if (keyboardAi == "mage") {
		scrAiMageGetInput();
	} else {
		scrKeyboardGetInput();
	}
} else {
    instance_destroy();
}

mask_index = object_get_sprite(hero);