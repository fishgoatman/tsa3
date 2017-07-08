/// @description fly to big chime
if (!tapped && !objBigChime.chime) {
    if (tpCompletedChimes < maxChimes) {
        targetX = tpChimes[tpCompletedChimes].x;
        targetY = tpChimes[tpCompletedChimes].y;
        tapped = true;
        sprite_index = sprChimeCarrierTapped;
        tpCompletedChimes++;
        
        if (tpCompletedChimes == maxChimes) {
            lastMouseChime = true;
        }
    }
}