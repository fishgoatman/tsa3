/// @description summon arrows
if (direct % 4 == 0) { //right
    for (var i = 0; i < room_height; i += gap) {
        instance_create(room_width - wallWidth, i, objArrowRight);
    }
} else if (direct % 4 == 1) { //up
    for (var i = 0; i < room_width; i += gap) {
        instance_create(i, wallWidth, objArrowUp);
    }
} else if (direct % 4 == 2) { //left
    for (var i = 0; i < room_height; i += gap) {
        instance_create(wallWidth, i, objArrowLeft);
    }
} else if (direct % 4 == 3) { //down
    for (var i = 0; i < room_width; i += gap) {
        instance_create(i, room_height - floorHeight, objArrowDown);
    }
}

direct++;
alarm[0] = delay;