///@desc get out of block
var startX = x;
var startY = y;
var i = 0;
var collideObj;

if (dy <= 0) {
	collideObj = objBlockAndPlatform;
} else {
	collideObj = objBlock;
}

while (place_meeting(x, y, collideObj)) {
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
