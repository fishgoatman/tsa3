/// @description make built
if (instance_exists(heroId)) {
    if (image_index >= image_number - image_speed) {
        image_speed = 0;
        image_index = image_number - 1;
        heroId.logicId.totems[heroId.logicId.numTotems] = heroId.logicId.buildingTotem;
        heroId.logicId.numTotems++;
    }
    
    if (!place_meeting(x, y + 1, objBlock)) {
        dy -= ddy;
        scrMove();
    }
} else {
    instance_destroy();
}

