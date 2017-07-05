/// @description move
scrMove();

if (place_meeting(preciseX, preciseY + 1, objBlock) || place_meeting(preciseX, preciseY - 1, objBlock)) {
    dy *= -1;
}

