/// @description creation stuff
projId = depth;
depth = 0;
thisNumber = projId.thisNumber;
myHeroId = heroId[thisNumber];
dmg = myHeroId.crescentPunchDmg;
dDmg = 0;
duration = 1;
forever = false;
time = 1;
currTime = 0;
image_angle = projId.image_angle;
image_xscale = projId.image_xscale;
image_yscale = projId.image_yscale;
image_index = projId.image_index;
image_speed = 0;
instance_create_depth(x, y, id, objCrescentPunchVisual);
hitSound = sndPunchHit

if (!place_meeting(x, y, objPlayer)) {
	audio_play_sound(sndPunchMiss, 1, false)
}