/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3AB2A1AA
/// @DnDArgument : "code" "///@desc damage$(13_10)scrDamageStuff();"
///@desc damage
scrDamageStuff();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 58EEEB9A
/// @DnDArgument : "code" "///@desc step stuff$(13_10)if (hp > 0) {$(13_10)	var meetingId = instance_place(preciseX, preciseY, objBot);$(13_10)	$(13_10)	if (meetingId != noone && meetingId != id) {$(13_10)		if (preciseX < meetingId.preciseX) {$(13_10)			dx *= -1;$(13_10)		} else if (preciseY < meetingId.preciseY) {$(13_10)			dy *= -1;$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (place_meeting(preciseX + 1, preciseY, objBlock) || place_meeting(preciseX - 1, preciseY, objBlock)) {$(13_10)		dx *= -1;$(13_10)	}$(13_10)	$(13_10)	if (place_meeting(preciseX, preciseY + 1, objBlock) || place_meeting(preciseX, preciseY - 1, objBlock)) {$(13_10)		dy *= -1;$(13_10)	}$(13_10)	$(13_10)	scrMove();$(13_10)$(13_10)	if (dx > 0) {$(13_10)		image_xscale = 1;$(13_10)	} else {$(13_10)		image_xscale = -1;$(13_10)	}$(13_10)$(13_10)	if (currTime > attackFrequency) {$(13_10)		currTime = 0;$(13_10)		instance_create_depth(preciseX, preciseY, thisNumber, objBotBullet);$(13_10)	}$(13_10)$(13_10)	currTime++;$(13_10)}"
///@desc step stuff
if (hp > 0) {
	var meetingId = instance_place(preciseX, preciseY, objBot);
	
	if (meetingId != noone && meetingId != id) {
		if (preciseX < meetingId.preciseX) {
			dx *= -1;
		} else if (preciseY < meetingId.preciseY) {
			dy *= -1;
		}
	}
	
	if (place_meeting(preciseX + 1, preciseY, objBlock) || place_meeting(preciseX - 1, preciseY, objBlock)) {
		dx *= -1;
	}
	
	if (place_meeting(preciseX, preciseY + 1, objBlock) || place_meeting(preciseX, preciseY - 1, objBlock)) {
		dy *= -1;
	}
	
	scrMove();

	if (dx > 0) {
		image_xscale = 1;
	} else {
		image_xscale = -1;
	}

	if (currTime > attackFrequency) {
		currTime = 0;
		instance_create_depth(preciseX, preciseY, thisNumber, objBotBullet);
	}

	currTime++;
}