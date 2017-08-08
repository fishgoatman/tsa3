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
}