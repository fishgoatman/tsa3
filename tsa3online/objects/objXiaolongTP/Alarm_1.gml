/// @description burst attack
if (heroId.firingMode == heroId.DRAGON) {
    if (currBurstAmount < burstAmount) {
        currBurstAmount++;
        instance_create(x, y, fireball);
        alarm[BURST] = burstInBetweenTime;
    } else {
        currBurstAmount = 0;
    }
}

