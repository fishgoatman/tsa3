/// @description burst attack
if (tpId.firingMode == tpId.DRAGON) {
    if (currBurstAmount < burstAmount) {
        currBurstAmount++;
        instance_create(x, y, fireball);
        alarm[BURST] = burstInBetweenTime;
    } else {
        currBurstAmount = 0;
    }
}

