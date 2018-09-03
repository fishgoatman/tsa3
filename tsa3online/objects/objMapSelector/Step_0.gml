/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 74C028A6
/// @DnDArgument : "code" "///@desc get input$(13_10)for (var i = 0; i < numKeys; i++) {$(13_10)	if (keyboard_check(rightKeyOrder[i]) || keyboard_check(leftKeyOrder[i])) {$(13_10)		if (durationHeld[i] > 0) {$(13_10)			heldBefore[i] = true;$(13_10)		}$(13_10)		$(13_10)		durationHeld[i]++;$(13_10)	} else {$(13_10)		durationHeld[i] = 0;$(13_10)		heldBefore[i] = false;$(13_10)	}$(13_10)}"
///@desc get input
for (var i = 0; i < numKeys; i++) {
	if (keyboard_check(rightKeyOrder[i]) || keyboard_check(leftKeyOrder[i])) {
		if (durationHeld[i] > 0) {
			heldBefore[i] = true;
		}
		
		durationHeld[i]++;
	} else {
		durationHeld[i] = 0;
		heldBefore[i] = false;
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 025603D8
/// @DnDArgument : "code" "///@desc selection$(13_10)if (!mapLockedIn) {$(13_10)	if (durationHeld[0] > 0 && !heldBefore[0]) {$(13_10)		currRow--$(13_10)	}$(13_10)	$(13_10)	if (durationHeld[1] > 0 && !heldBefore[1]) {$(13_10)		currCol--$(13_10)	}$(13_10)	$(13_10)	if (durationHeld[2] > 0 && !heldBefore[2]) {$(13_10)		currRow++$(13_10)	}$(13_10)	$(13_10)	if (durationHeld[3] > 0 && !heldBefore[3]) {$(13_10)		currCol++$(13_10)	}$(13_10)$(13_10)	if (currRow < 0) {$(13_10)		currRow = numRows - 1$(13_10)	} else if (currRow >= numRows) {$(13_10)		currRow = 0$(13_10)	}$(13_10)$(13_10)	if (currCol < 0) {$(13_10)		currCol = array_length_2d(mapSelect, currRow) - 1;$(13_10)	} else if (currCol >= array_length_2d(mapSelect, currRow)) {$(13_10)		currCol = 0$(13_10)	}$(13_10)$(13_10)	objGeneralNew.selectedMap = mapSelect[currRow, currCol]$(13_10)	x = mapSelectBoxes[currRow, currCol].x$(13_10)	y = mapSelectBoxes[currRow, currCol].y$(13_10)	$(13_10)	for (var i = 4; i < 8; i++) {$(13_10)		if (durationHeld[i] > 0 && !heldBefore[i]) {$(13_10)			mapLockedIn = true$(13_10)			image_index = 1$(13_10)			break$(13_10)		}$(13_10)	}$(13_10)}$(13_10)$(13_10)/////temp for auto$(13_10)/*if (auto) {$(13_10)	mapLockedIn = true;$(13_10)	selectedHero[thisNumber] = "random";$(13_10)}*/"
///@desc selection
if (!mapLockedIn) {
	if (durationHeld[0] > 0 && !heldBefore[0]) {
		currRow--
	}
	
	if (durationHeld[1] > 0 && !heldBefore[1]) {
		currCol--
	}
	
	if (durationHeld[2] > 0 && !heldBefore[2]) {
		currRow++
	}
	
	if (durationHeld[3] > 0 && !heldBefore[3]) {
		currCol++
	}

	if (currRow < 0) {
		currRow = numRows - 1
	} else if (currRow >= numRows) {
		currRow = 0
	}

	if (currCol < 0) {
		currCol = array_length_2d(mapSelect, currRow) - 1;
	} else if (currCol >= array_length_2d(mapSelect, currRow)) {
		currCol = 0
	}

	objGeneralNew.selectedMap = mapSelect[currRow, currCol]
	x = mapSelectBoxes[currRow, currCol].x
	y = mapSelectBoxes[currRow, currCol].y
	
	for (var i = 4; i < 8; i++) {
		if (durationHeld[i] > 0 && !heldBefore[i]) {
			mapLockedIn = true
			image_index = 1
			break
		}
	}
}

/////temp for auto
/*if (auto) {
	mapLockedIn = true;
	selectedHero[thisNumber] = "random";
}*//**/