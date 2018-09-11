/// @description creation stuff
projId = depth;
depth = 0;
thisNumber = projId.thisNumber;
myHeroId = heroId[thisNumber];
dmg = myHeroId.fanBaseDmg + projId.currTime * myHeroId.fanDmgIncrease;
dDmg = 0;
duration = 1;
forever = false;
time = 1;
currTime = 0;
image_angle = projId.image_angle;
hitSound = sndKnifeHit

if (!place_meeting(x, y, objPlayer)) {
	audio_play_sound(sndKnifeMiss, 1, false)
}