/// @description fly to big chime
if (!tapped && !objBigChime.chime) {
    if (other.controlScheme == MOUSE && mpCompletedChimes < maxChimes) {
        targetX = mpChimes[mpCompletedChimes].x;
        targetY = mpChimes[mpCompletedChimes].y;
        tapped = true;
        sprite_index = sprChimeCarrierTapped;
        mpCompletedChimes++;
        
        if (mpCompletedChimes == maxChimes) {
            lastMouseChime = true;
        }
    } else if (other.controlScheme == KEYBOARD && kpCompletedChimes < maxChimes) {
        targetX = kpChimes[kpCompletedChimes].x;
        targetY = kpChimes[kpCompletedChimes].y;
        tapped = true;
        sprite_index = sprChimeCarrierTapped;
        kpCompletedChimes++;
        
        if (kpCompletedChimes == maxChimes) {
            lastKeyboardChime = true;
        }
    }
}

