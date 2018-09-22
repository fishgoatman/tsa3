///@desc get out of block
var startX = preciseX;
var startY = preciseY;
var tryX = startX
var tryY = startY
var i = 0;
var collideObj;

if (dy <= 0) {
	collideObj = objBlockAndPlatform;
} else {
	collideObj = objBlock;
}

while (place_meeting(tryX, tryY, collideObj)) {
    if (i % 4 == 0) {
        tryX = startX + i / 4;
        tryY = startY;
    } else if (i % 4 == 1) {
        tryX = startX - i / 4;
        tryY = startY;
    } else if (i % 4 == 2) {
        tryX = startX;
        tryY = startY + i / 4;
    } else {
        tryX = startX;
        tryY = startY - i / 4;
    }

    i++;
}

preciseX = tryX
preciseY = tryY
x = scrRound(preciseX)
y = scrRound(preciseY)
