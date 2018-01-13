///@desc get out of block
var startX = x;
var startY = y;
var i = 0;

while (physics_test_overlap(x, y, image_angle, objBlock)) {
    if (i % 4 == 0) {
        x = startX + i / 4;
        y = startY;
    } else if (i % 4 == 1) {
        x = startX - i / 4;
        y = startY;
    } else if (i % 4 == 2) {
        x = startX;
        y = startY + i / 4;
    } else {
        x = startX;
        y = startY - i / 4;
    }

    i++;
}

preciseX = x;
preciseY = y;
