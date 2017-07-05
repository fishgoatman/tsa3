/// @description give warning
if (direct % 4 == 0) { //right
    instance_create(room_width - wallWidth - warningOffset, room_height / 2, objWarning);
} else if (direct % 4 == 1) { //up
    instance_create(room_width / 2, wallWidth + warningOffset, objWarning);
} else if (direct % 4 == 2) { //left
    instance_create(wallWidth + warningOffset, room_height / 2, objWarning);
} else if (direct % 4 == 3) { //down
    instance_create(room_width / 2, room_height - floorHeight - warningOffset, objWarning);
}

alarm[1] = delay;

