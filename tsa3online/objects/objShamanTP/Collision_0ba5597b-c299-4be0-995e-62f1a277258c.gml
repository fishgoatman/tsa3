/// @description get blown
if (place_meeting(preciseX, preciseY + 1, objBlock)) {
	preciseY--;
}

if (naturalDy < maxWindDy) {
    naturalDy += windDdy;
    
    if (naturalDy > maxWindDy) {
        naturalDy = maxWindDy;
    }
}