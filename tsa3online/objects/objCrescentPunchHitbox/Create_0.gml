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
image_index = projId.image_index;
image_speed = 0;
instance_create_depth(x, y, id, objCrescentPunchVisual);