/// @description creation stuff
projId = depth;
depth = 0;
thisNumber = projId.thisNumber;
myHeroId = heroId[thisNumber];
dmg = myHeroId.flashKickDmg;
dDmg = 0;
duration = 1;
forever = false;
time = 1;
currTime = 0;
image_xscale = projId.image_xscale;
image_index = image_number - 1;
image_speed = 0;
instance_create_depth(x, y, id, objFlashKickVisual);
hitSound = sndKickHit