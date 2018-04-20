///@desc mage stats
thisNumber = depth;
depth = 0;
maxHp = 100;

if (thisNumber == 1) {
	maxHp *= 1;
}

moveSpd = 95 / room_speed;
jumpPower = 340 / room_speed;
grav = 750 / (room_speed * room_speed);
airJumps = 0;
currAirJumps = 0;
bounciness = 0.3;

//slash
windUp[0] = 0.04 * room_speed;
duration[0] = 0.06 * room_speed;
windDown[0] = 0.05 * room_speed;
slowWindUp[0] = 0.3;
slowDuring[0] = 1;
slowWindDown[0] = 0.3;
cooldown[0] = 1.7 * room_speed;

slashDmg = 9;

slashBlastAmount = 10;
slashBlastSpread = 55;
slashBlastCentralAngle = -45;
slashBlastAheadDist = 40;
slashHitboxDuration = 0.2 * room_speed;

//lob
windUp[1] = 0.02 * room_speed;
duration[1] = 1;
windDown[1] = 0.02 * room_speed;
slowWindUp[1] = 0.3;
slowDuring[1] = 0.7;
slowWindDown[1] = 0.3;
cooldown[1] = 1.6 * room_speed;

lobDmg = 7;

maxLobs = 5;
lobAngleBetween = 16;
lobDist = 16;
lobBaseAngle = 37;
timePerLobCharge = 0.28 * room_speed;
lobSpd = 520 / room_speed;
lobHitboxDuration = 0.05 * room_speed;
lobGrav = 800 / (room_speed * room_speed);

//rocket
windUp[2] = 0 * room_speed;
duration[2] = 0.35 * room_speed;
windDown[2] = 0 * room_speed;
slowWindUp[2] = 0.3;
slowDuring[2] = 3;
slowWindDown[2] = 0;
cooldown[2] = 4.1 * room_speed;

rocketSpd = 600 / room_speed;
rocketDec = rocketSpd / duration[2] / room_speed;

//blast
windUp[3] = 0.4 * room_speed;
duration[3] = 0.2 * room_speed;
windDown[3] = 0.35 * room_speed;
slowWindUp[3] = 0;
slowDuring[3] = 0;
slowWindDown[3] = 0;
cooldown[3] = 3.8 * room_speed;

blastDmgIncrease = 1.6 / room_speed;
blastBaseDmg = 1.2;

blastAmount = 25;
blastSpread = 70;
blastSpd = 210 / room_speed;
blastTime = 999 * room_speed;
blastRecoilSpd = -270 / room_speed;
blastRecoilDSpd = 15 / room_speed;
blastRecoilDuration = 0.3 * room_speed;
blastHitboxDuration = 0.05 * room_speed;