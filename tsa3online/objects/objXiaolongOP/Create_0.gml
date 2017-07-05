/// @description creation stuff
heroId = opId;
fireball = objFireblastKP;
image_speed = 0.15;
burstAttackCooldown = 1 / image_speed * 4;
burstAmount = 1;
currBurstAmount = 0;
burstInBetweenTime = 0.2 * room_speed;
COOLDOWN = 0;
BURST = 1;
alarm[COOLDOWN] = burstAttackCooldown;
image_xscale = heroId.image_xscale;
offset = 10;

