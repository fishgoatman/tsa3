/// @description make built
if (instance_exists(opId)) {
    if (image_index >= image_number - image_speed) {
        image_speed = 0;
        image_index = image_number - 1;
        opId.logicId.totems[opId.logicId.numTotems] = opId.logicId.buildingTotem;
        opId.logicId.numTotems++;
    }
    
    if (!place_meeting(x, y + 1, objBlock)) {
        dy -= ddy;
        scrMove();
    }
} else {
    instance_destroy();
}

