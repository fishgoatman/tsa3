/// @description creation stuff
projId = depth;
depth = 0;
thisNumber = projId.thisNumber;
myHeroId = heroId[thisNumber];
dmg = myHeroId.palmDmg;
dDmg = 0;
duration = 1;
forever = false;
time = 1;
currTime = 0;
image_angle = projId.image_angle;
instance_create_depth(x, y, id, objPalmVisual);

if (image_angle > 90 && image_angle < 270) {
	image_yscale = -1;
}

hitSound = sndPalmHit

if (!place_meeting(x, y, objPlayer)) {
	audio_play_sound(sndPalmMiss, 1, false)
}