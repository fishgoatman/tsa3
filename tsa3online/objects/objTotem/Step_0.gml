/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 29FE8C5C
/// @DnDArgument : "code" "/// @description make built$(13_10)if (instance_exists(heroId)) {$(13_10)    if (image_index >= image_number - image_speed) {$(13_10)        image_speed = 0;$(13_10)        image_index = image_number - 1;$(13_10)        ds_list_add(heroId.logicId.totems, heroId.logicId.buildingTotem);$(13_10)        heroId.logicId.numTotems++;$(13_10)    }$(13_10)    $(13_10)    if (!place_meeting(x, y + 1, objBlock)) {$(13_10)        dy -= ddy;$(13_10)        scrMove();$(13_10)    }$(13_10)	$(13_10)	if (instance_exists(durationBar)) {$(13_10)		durationBar.x = x;$(13_10)		durationBar.y = y;$(13_10)		$(13_10)		if (durationBar.image_index == 0) {$(13_10)			instance_destroy();$(13_10)			var temp = heroId.logicId.totems;$(13_10)			ds_list_delete(temp, ds_list_find_index(temp, id));$(13_10)			heroId.logicId.numTotems--;$(13_10)	$(13_10)			with (durationBar) {$(13_10)				instance_destroy();$(13_10)			}$(13_10)		}$(13_10)	}$(13_10)} else {$(13_10)    instance_destroy();$(13_10)	$(13_10)	with (durationBar) {$(13_10)		instance_destroy();$(13_10)	}$(13_10)	$(13_10)	with (aura) {$(13_10)		instance_destroy();$(13_10)	}$(13_10)}"
/// @description make built
if (instance_exists(heroId)) {
    if (image_index >= image_number - image_speed) {
        image_speed = 0;
        image_index = image_number - 1;
        ds_list_add(heroId.logicId.totems, heroId.logicId.buildingTotem);
        heroId.logicId.numTotems++;
    }
    
    if (!place_meeting(x, y + 1, objBlock)) {
        dy -= ddy;
        scrMove();
    }
	
	if (instance_exists(durationBar)) {
		durationBar.x = x;
		durationBar.y = y;
		
		if (durationBar.image_index == 0) {
			instance_destroy();
			var temp = heroId.logicId.totems;
			ds_list_delete(temp, ds_list_find_index(temp, id));
			heroId.logicId.numTotems--;
	
			with (durationBar) {
				instance_destroy();
			}
		}
	}
} else {
    instance_destroy();
	
	with (durationBar) {
		instance_destroy();
	}
	
	with (aura) {
		instance_destroy();
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1F21D678
/// @DnDArgument : "code" "///@desc type$(13_10)if (!created) {$(13_10)	if (type == "earth") {$(13_10)		if (instance_exists(aura)) {$(13_10)			with (aura) {$(13_10)				instance_destroy();$(13_10)			}$(13_10)		}$(13_10)		$(13_10)		aura = instance_create(x, y, objEarthAuraTP);$(13_10)		created = true;$(13_10)	} if (type == "fire") {$(13_10)		if (instance_exists(aura)) {$(13_10)			with (aura) {$(13_10)				instance_destroy();$(13_10)			}$(13_10)		}$(13_10)	$(13_10)		aura = instance_create(x, y, objFireAuraTP);$(13_10)		created = true;$(13_10)	}$(13_10)}"
///@desc type
if (!created) {
	if (type == "earth") {
		if (instance_exists(aura)) {
			with (aura) {
				instance_destroy();
			}
		}
		
		aura = instance_create(x, y, objEarthAuraTP);
		created = true;
	} if (type == "fire") {
		if (instance_exists(aura)) {
			with (aura) {
				instance_destroy();
			}
		}
	
		aura = instance_create(x, y, objFireAuraTP);
		created = true;
	}
}