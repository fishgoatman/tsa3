/// @description fly to big chime
if (!tapped && !objBigChime.chime) {
    if (tpCompletedChimes < maxChimes) {
        targetX = mpChimes[tpCompletedChimes].x;
        targetY = mpChimes[tpCompletedChimes].y;
        tapped = true;
        sprite_index = sprChimeCarrierTapped;
        tpCompletedChimes++;
        
        if (tpCompletedChimes == maxChimes) {
            lastMouseChime = true;
        }
    }
}