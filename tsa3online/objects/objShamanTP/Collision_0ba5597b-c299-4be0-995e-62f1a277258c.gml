/// @description get blown
if (dy < maxWindDy) {
    dy += windDdy;
    
    if (dy > maxWindDy) {
        dy = maxWindDy;
    }
}

